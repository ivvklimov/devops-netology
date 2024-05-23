## Домашнее задание

https://github.com/netology-code/kuber-homeworks/blob/main/1.5/1.5.md

### Задание 1

Поднимаем frontend, backend и services

```
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl apply -f backend.yaml
kubectl apply -f frontend.yaml
kubectl apply -f svc-backend.yaml
kubectl apply -f svc-frontend.yaml
kubectl get deployments
kubectl get pods
kubectl get svc
```

![image](png/service.png)

Инфраструктура успешно развернута.

Проверяем доступность backend с frontend

```
kubectl exec -it frontend-75b655654-5r74b -- /bin/bash
curl backend:1180
```

![image](png/frontend-to-backend.png)

Проверяем доступность frontend с backend

```
kubectl exec -it backend-f989cc7c7-xztq8 -- /bin/bash
curl frontend
```

![image](png/backend-to-frontend.png)

Приложения видят друг друга.

Манифесты:
- [backend.yaml](backend.yaml)
- [frontend.yaml](frontend.yaml)
- [svc-backend.yaml](svc-backend.yaml)
- [svc-frontend.yaml](svc-frontend.yaml)
