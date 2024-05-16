## Домашнее задание

https://github.com/netology-code/kuber-homeworks/blob/main/1.4/1.4.md

### Задание 1

- Поднимаем 3 реплики пода с двумя контейнерами nginx и multitool через deployment
- Усанавливаем сервис для доступа к приложениям
- Запускаем в отдельном поде multitool

```
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f multitool.yaml
kubectl get deployments
kubectl get pods
kubectl get svc
```

![image](png/service.png)

Инфраструктура успешно развернута.

Пробуем открыть nginx и multitool:

```
kubectl exec -it multitool -- /bin/bash
curl nginx:9001
curl nginx:9002
```

![image](png/multitool.png)

Приложения успешно открываются.

Манифесты:
- [deployment](deployment.yaml)
- [service](service.yaml)

