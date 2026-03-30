# Proxmox 9.x — NVIDIA GPU Passthrough to LXC
### Complete Step-by-Step Guide (RTX 3060 / OpenWebUI)

---

## Prerequisites

- Proxmox 9.x installed and running
- NVIDIA GPU physically installed in the host machine
- An existing LXC container (this guide uses ID `100`)
- Internet access on the Proxmox host

---

## Part 1 — Prepare the Proxmox Host

### Step 1: Install Proxmox Kernel Headers

```bash
apt update
apt install -y pve-headers
```

> Proxmox uses its own kernel headers (`pve-headers`), NOT the standard `linux-headers` package. Never use `linux-headers-$(uname -r)` on Proxmox — it will fail.

---

### Step 2: Fix apt Sources (Remove Duplicates)

Proxmox 9 uses two source files that can conflict. Check both:

```bash
cat /etc/apt/sources.list
cat /etc/apt/sources.list.d/debian.sources
```

Empty out `sources.list` to avoid duplicate warnings:

```bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo "" > /etc/apt/sources.list
```

Edit `debian.sources` to include `non-free` components:

```bash
nano /etc/apt/sources.list.d/debian.sources
```

Replace the contents with:

```
Types: deb
URIs: http://deb.debian.org/debian/
Suites: trixie trixie-updates
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: http://security.debian.org/debian-security/
Suites: trixie-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```

Then update:

```bash
apt update
```

---

### Step 3: Blacklist the Nouveau Driver

The open-source `nouveau` driver conflicts with the NVIDIA driver and must be disabled:

```bash
echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
update-initramfs -u
reboot
```

---

### Step 4: Install Build Dependencies

After reboot:

```bash
apt install -y build-essential dkms
```

---

### Step 5: Download the NVIDIA Driver

Go to https://www.nvidia.com/Download/index.aspx and select:

- **Product Type:** GeForce
- **Product Series:** GeForce RTX 30 Series
- **Product:** GeForce RTX 3060
- **Operating System:** Linux 64-bit
- **Download Type:** Production Branch

Note the version number and download it:

```bash
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/580.142/NVIDIA-Linux-x86_64-580.142.run
chmod +x NVIDIA-Linux-x86_64-580.142.run
```

> Replace `580.142` with whatever the current version is at the time of download.

---

### Step 6: Install the NVIDIA Driver on the Host

```bash
./NVIDIA-Linux-x86_64-580.142.run --dkms --no-questions --ui=none
```

- `--dkms` — rebuilds the kernel module automatically after kernel updates
- `--no-questions` — skips interactive prompts
- `--ui=none` — runs headlessly (no GUI required)

---

### Step 7: Verify the Host Driver

```bash
nvidia-smi
```

You should see your GPU listed with the driver version and CUDA version. Example:

```
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.142     Driver Version: 580.142    CUDA Version: 13.0                   |
| GPU  Name                 ...  RTX 3060  ...                                            |
+-----------------------------------------------------------------------------------------+
```

---

### Step 8: Configure NVIDIA Modules to Load at Boot

Write a clean modules-load config. Use `>` (overwrite) not `>>` (append) to avoid duplicates:

```bash
cat > /etc/modules-load.d/nvidia.conf << EOF
nvidia
nvidia-modeset
nvidia-uvm
EOF
```

---

### Step 9: Create a udev Rule for Device Permissions

This ensures NVIDIA devices get correct permissions when the kernel loads them:

```bash
cat > /etc/udev/rules.d/70-nvidia.rules << EOF
KERNEL=="nvidia", RUN+="/usr/bin/nvidia-modprobe -c0"
KERNEL=="nvidia_uvm", RUN+="/usr/bin/nvidia-modprobe -u"
EOF
```

Reload udev rules immediately:

```bash
udevadm control --reload-rules
udevadm trigger
```

---

### Step 10: Create the nvidia-init systemd Service

This service runs at boot on the **host** and ensures all NVIDIA devices are fully initialized before the LXC starts. It also creates `nvidiactl` and `nvidia0` via `mknod` as a fallback — this is necessary on Proxmox/Debian Trixie where `nvidia-modprobe -c0` does not always create these devices automatically.

> ⚠️ **Critical:** Make sure you are on the **host** (`root@pve`) and NOT inside the LXC when running these commands. Your prompt tells you where you are — `root@pve` is the host, `root@openwebui` is inside the LXC.

```bash
nano /etc/systemd/system/nvidia-init.service
```

```ini
[Unit]
Description=Initialize NVIDIA devices before LXC
Before=pve-guests.service
After=systemd-udev-settle.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/nvidia-modprobe -c0 -u
ExecStartPost=/bin/bash -c '[ -e /dev/nvidiactl ] || mknod -m 666 /dev/nvidiactl c 195 255'
ExecStartPost=/bin/bash -c '[ -e /dev/nvidia0 ] || mknod -m 666 /dev/nvidia0 c 195 0'
ExecStartPost=/bin/sleep 2

[Install]
WantedBy=multi-user.target
```

Enable and start it:

```bash
systemctl daemon-reload
systemctl enable nvidia-init.service
systemctl start nvidia-init.service
systemctl status nvidia-init.service
```

It should show `Active: active (exited)` — this is normal for `oneshot` services.

Verify all devices exist on the host:

```bash
ls -la /dev/nvidia*
```

You should see all four devices with `crw-rw-rw-` permissions:

```
crw-rw-rw- 1 root root 195,   0 /dev/nvidia0
crw-rw-rw- 1 root root 195, 255 /dev/nvidiactl
crw-rw-rw- 1 root root 509,   0 /dev/nvidia-uvm
crw-rw-rw- 1 root root 509,   1 /dev/nvidia-uvm-tools
```

---

## Part 2 — Configure LXC GPU Passthrough

### Step 11: Edit the LXC Config

```bash
nano /etc/pve/lxc/100.conf
```

Add the following lines at the bottom:

```ini
# NVIDIA GPU passthrough
lxc.cgroup2.devices.allow: c 195:* rwm
lxc.cgroup2.devices.allow: c 509:* rwm
lxc.cgroup2.devices.allow: c 234:* rwm

lxc.mount.entry: /dev/nvidia0 dev/nvidia0 none bind,optional,create=file
lxc.mount.entry: /dev/nvidiactl dev/nvidiactl none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-uvm dev/nvidia-uvm none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-uvm-tools dev/nvidia-uvm-tools none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-caps/nvidia-cap1 dev/nvidia-caps/nvidia-cap1 none bind,optional,create=file
lxc.mount.entry: /dev/nvidia-caps/nvidia-cap2 dev/nvidia-caps/nvidia-cap2 none bind,optional,create=file
```

> The major numbers 195, 509, and 234 matched this setup. Always verify yours with `ls -la /dev/nvidia*` and adjust if different.

Save and exit (`Ctrl+X`, `Y`, `Enter`).

---

### Step 12: Restart the LXC

```bash
pct stop 100 && pct start 100
```

---

## Part 3 — Install NVIDIA Userspace Libraries in the LXC

### Step 13: Enter the LXC

```bash
pct exec 100 -- bash
```

---

### Step 14: Download and Install NVIDIA Userspace Libraries

Use the **exact same version** as the host driver. The `--no-kernel-modules` flag is critical — the LXC shares the host kernel and must NOT build kernel modules:

```bash
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/580.142/NVIDIA-Linux-x86_64-580.142.run
chmod +x NVIDIA-Linux-x86_64-580.142.run
./NVIDIA-Linux-x86_64-580.142.run --no-kernel-modules --no-questions --ui=none
```

---

### Step 15: Verify GPU Inside the LXC

```bash
nvidia-smi
```

You should see the RTX 3060 listed. Exit the LXC:

```bash
exit
```

---

## Part 4 — Enable GPU for OpenWebUI (Helper Script Install)

OpenWebUI installed via the Tteck/community helper scripts runs as a **systemd service** inside the LXC.

### Step 16: Enter the LXC and Edit the Service

```bash
pct exec 100 -- bash
nano /etc/systemd/system/open-webui.service
```

In the `[Service]` section, add:

```ini
Environment="CUDA_VISIBLE_DEVICES=0"
Environment="USE_CUDA_DOCKER=true"
```

---

### Step 17: Reload and Restart

```bash
systemctl daemon-reload
systemctl restart open-webui
exit
```

---

## Part 5 — Verify Everything Works

### Step 18: Monitor GPU Usage

On the **host**, run:

```bash
watch -n 1 nvidia-smi
```

Send a chat message in OpenWebUI. You should see:

- GPU memory usage increase
- A Python process from OpenWebUI listed under `Processes`
- GPU utilization spike during inference

A working output looks like:

```
|   0  NVIDIA GeForce RTX 3060  Off | 00000000:04:00.0 Off |  N/A |
|  0%   30C    P2   25W / 170W  |  216MiB / 12288MiB |   0%  Default |

| Processes:
|  0   N/A  N/A   529  C  ...open-webui/bin/python   208MiB |
```

---

## Part 6 — Test Persistence After Reboot

### Step 19: Full Reboot Test

```bash
reboot
```

After reboot, verify each of these in order:

```bash
# 1. Check nvidia-init service ran successfully
systemctl status nvidia-init.service

# 2. Check all host devices exist
ls -la /dev/nvidia*

# 3. Check GPU visible in LXC
pct exec 100 -- nvidia-smi

# 4. Check OpenWebUI is running
pct exec 100 -- systemctl status open-webui
```

Expected results:

- `nvidia-init.service` → `Active: active (exited)`
- `/dev/nvidia*` → all 4 devices with `crw-rw-rw-` permissions
- `nvidia-smi` in LXC → RTX 3060 listed
- `open-webui` → `Active: active (running)`

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `nvidia-smi` fails in LXC | Driver version mismatch — reinstall `.run` inside LXC with exact same version as host |
| Devices mount as empty files with no permissions inside LXC | `nvidia-init.service` not running correctly on host — check `systemctl status nvidia-init.service` |
| `nvidia-init.service` failed with "File exists" | `mknod` tried to create a device that already exists — ensure the service uses the `[ -e /dev/nvidiactl ] \|\| mknod` conditional syntax |
| `nvidia-init.service` running inside LXC instead of host | Service was accidentally created while inside the LXC — delete with `pct exec 100 -- rm /etc/systemd/system/nvidia-init.service` then recreate on the host |
| `/dev/nvidiactl` missing after boot | `nvidia-modprobe -c0` not creating it automatically — the `mknod` fallback lines in `nvidia-init.service` handle this |
| `nvidia-driver` package not found via apt | Use the `.run` installer — Debian Trixie's packaged NVIDIA drivers have broken dependencies |
| `/dev/nvidia-uvm` missing | Run `nvidia-modprobe -u` on host — ensure `nvidia-uvm` is in `/etc/modules-load.d/nvidia.conf` |
| `nouveau` conflict | Verify `/etc/modprobe.d/blacklist-nouveau.conf` exists and `update-initramfs -u` was run |
| DKMS module not building | Confirm `pve-headers` is installed and matches running kernel (`uname -r`) |
| LXC won't start after config edit | Check `/etc/pve/lxc/100.conf` for typos in mount entries |
| GPU not used by OpenWebUI | Check systemd service environment variables and restart with `systemctl restart open-webui` |
| Duplicate entries in `/etc/modules-load.d/nvidia.conf` | Use `cat >` not `echo >>` to overwrite the file cleanly |

---

## Summary of Key Points

- Proxmox uses `pve-headers` not `linux-headers` — never use `linux-headers-$(uname -r)`
- Always use the official NVIDIA `.run` installer on Proxmox/Debian Trixie — the packaged versions have broken dependencies
- The host and LXC **must use the exact same driver version**
- Inside the LXC, always install with `--no-kernel-modules`
- The `nvidia-init.service` **must be created on the host** (`root@pve`), not inside the LXC
- `nvidia-modprobe -c0` may not create `nvidiactl` on Proxmox/Trixie — the `mknod` fallback in the service handles this
- Major device numbers (195, 509, 234) can vary — always verify with `ls -la /dev/nvidia*`
- Watch your shell prompt — `root@pve` means host, `root@openwebui` means inside the LXC
