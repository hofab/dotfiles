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
