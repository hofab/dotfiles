# Update a Docker Image Without a Dockerfile (Using `docker commit`)
This guide explains how to update an existing Docker image by modifying a running container and committing the changes into a new image. This method allows you to install packages (e.g., using `apt install`) **without creating a Dockerfile**.

---

## 🚀 Steps

### 1. Start a container from your base image

```bash
docker run -it --name mytemp registry.example.com/myimage:latest bash
```

Replace:

- `mytemp` → name for your temporary container
- `registry.example.com/myimage:latest` → your base image

---

### 2. Inside the container, update and install packages

```bash
apt-get update
apt-get install -y <your-packages>
```

Example:

```bash
apt-get update
apt-get install -y nano curl git
```

---

### 3. Exit the container

```bash
exit
```

---

### 4. Commit the modified container as a new image

```bash
docker commit mytemp registry.example.com/myimage:updated
```

Or overwrite an existing tag:

```bash
docker commit mytemp registry.example.com/myimage:latest
```

---

### 5. Push the new image to your registry

```bash
docker push registry.example.com/myimage:updated
```

Or, if overwriting:

```bash
docker push registry.example.com/myimage:latest
```

---

## ✔️ Notes

- This method records **all changes** made inside the container.
- It is ideal for quick updates or testing.
- For long-term reproducibility, using a Dockerfile is recommended, but this workflow works when you need something fast.

# Docker Registry Credentials Setup (Arch Linux / i3)

Securely store Docker credentials using `pass` (GPG-backed) instead of plain text.

## Prerequisites

```bash
paru -S docker-credential-pass-bin pass gnupg
```

## 1. Generate a GPG Key

```bash
gpg --gen-key
```

Note your full key fingerprint:

```bash
gpg --list-keys
```

## 2. Initialize Pass

```bash
pass init <your-gpg-key-fingerprint>
```

## 3. Configure Docker

```bash
echo '{"credsStore": "pass"}' > ~/.docker/config.json
```

## 4. Login to Registry

```bash
docker login gitlab.sflmissions.com:5050
# Username: fhof
# Password: <your GitLab Personal Access Token>
```

> ⚠️ Use a **Personal Access Token** (not your password) with `read_registry` scope.
> Generate one at: `https://gitlab.sflmissions.com/-/user_settings/personal_access_tokens`

## Verify Stored Credentials

```bash
pass ls
pass show docker-credential-helpers/<encoded-registry>/<username>
```

## Optional: Cache GPG Passphrase (8 hours)

```bash
echo 'default-cache-ttl 28800' >> ~/.gnupg/gpg-agent.conf
echo 'max-cache-ttl 28800' >> ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent
```

## Notes

- Tokens expire — regenerate in GitLab and re-run `docker login` when needed.
- Credentials are GPG-encrypted, never stored in plain text.
