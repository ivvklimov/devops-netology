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

### Задание 2

Посмотрим подключенные/доступные модули

```
microk8s status
```

![image](png/microk8s-status-01.png)

Модуль Ingress отключен.

Включаем модуль Ingress

```
microk8s enable ingress
```

![image](png/microk8s-enable-ingress.png)

Посмотрим подключенные/доступные модули

```
microk8s status
```

![image](png/microk8s-status-02.png)

Модуль Ingress включен.

Настраиваем Ingress

```
kubectl get ingress
kubectl apply -f ingress.yaml
kubectl get ingress
```

![image](png/ingress.png)

Ingress в Lens

![image](png/ingress-lens.png)

Проверяем доступность приложений через Ingress с другого компьютера

```
На компьютере, с которого будем поключаться к приложениям, предварительно необходимо добавить в /etc/hosts запись вида:
192.168.0.35 example.local

где 192.168.0.35 адрес Ingress
```

![image](png/ingress-test.png)

Приложения успешно открываются.

Манифесты:
- [ingress.yaml](ingress.yaml)
