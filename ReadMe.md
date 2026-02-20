# Assignment 3 – Container Deployment & Orchestration

## **Description**

Deploy a small web app with Nginx, containerized using Docker, pushed to Docker Hub, and orchestrated with Kubernetes (Minikube).

---

## **Project Files**

- **index.html** – Displays: `Hello from Rohan - running on port 8085!`
- **style.css** – Red background, white font
- **image.jpg** – Custom image for the page
- **Dockerfile** – Builds Nginx container with the above files, exposes port 8085
- **deployment-67.yml** – Kubernetes Deployment (3 replicas) + NodePort Service
- **service.yml** – NodePort service configuration (if using separate file)

---

## **Part 1 — Docker Image**

1. **Build Docker image**

```bash
docker build -t c0957767/assignment03-nginx:latest .
```

2. **Test locally**

```bash
docker run -p 8085:8085 c0957767/assignment03-nginx:latest
```

3. **Push to Docker Hub**

```bash
docker push c0957767/assignment03-nginx:latest
```

4. **Docker Hub URL**
   [https://hub.docker.com/repository/docker/c0957767/assignment03-nginx/general](https://hub.docker.com/repository/docker/c0957767/assignment03-nginx/general)

---

## **Part 2 — Kubernetes Deployment**

1. **Deploy Deployment YAML**

```bash
kubectl apply -f deployment-67.yml
```

2. **Deploy Service (NodePort)**

```bash
kubectl apply -f service.yml
```

3. **Verify Kubernetes objects**

```bash
kubectl get pods
kubectl get svc
kubectl get deploy
kubectl get rs
```

4. **Observe auto-healing**

- Watch pods in real-time:

```bash
kubectl get pods -w
```

- Delete a pod to see auto-healing in action:

```bash
kubectl delete pod <pod-name>
```

- Kubernetes automatically recreates the deleted pod to maintain 3 replicas.

---

- Delete a pod to see auto-healing in action:

```bash
kubectl delete deployment devops-app-22
```
