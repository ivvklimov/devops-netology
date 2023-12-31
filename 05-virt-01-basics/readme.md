##### 1.
Полная виртуализация:
Изолирует ВМ от хоста и друг от друга, эмулирует полную аппаратную среду.

Паравиртуализация:
Операционные системы виртуализованы, но взаимодействуют напрямую с гипервизором для повышения производительности.

Виртуализация на основе ОС:
Контейнеры разделяют ядро ОС и обеспечивают изоляцию, используя общие ресурсы для эффективного использования.

-----------------
##### 2.
Для разных условий использования, можно выбрать различные методы организации серверов:

Высоконагруженная база данных, чувствительная к отказу: Физические сервера.
Физические сервера обеспечат максимальные ресурсы, изоляцию и предсказуемую производительность, что важно для критических баз данных. Это уменьшит возможность воздействия других систем на работу базы данных.

Различные web-приложения: Виртуализация уровня ОС (контейнеризация).
Контейнеры обеспечат изоляцию приложений и эффективное использование ресурсов. Это позволит развернуть различные веб-приложения на одном физическом сервере с возможностью масштабирования.

Windows-системы для использования бухгалтерским отделом: Паравиртуализация.
Паравиртуализация позволит использовать несколько экземпляров Windows на одном хосте. Это обеспечит управление различными системами Windows и обеспечит отличную изоляцию.

Системы, выполняющие высокопроизводительные расчёты на GPU: Физические сервера.
Физический сервер с GPU обеспечит выделенный доступ к вычислительным ресурсам GPU для высокопроизводительных расчетов, обеспечивая предсказуемую производительность и изоляцию.

-----------------
##### 3.
Для каждого из предложенных сценариев, оптимальный выбор системы управления виртуализацией может отличаться:

100 виртуальных машин, общие задачи, Windows-based инфраструктура: VMware vSphere (VMware ESXi).
VMware vSphere обеспечивает хорошую поддержку Windows и Linux VM, программные балансировщики нагрузки, репликацию данных, автоматизированные резервные копии. Имеет развитую экосистему инструментов для управления и масштабируемости.

Бесплатное open source-решение для небольшой инфраструктуры: KVM (Kernel-based Virtual Machine).
KVM интегрирован в ядро Linux, обеспечивает высокую производительность и совместимость с Linux и Windows VM. Он также предоставляет широкие возможности настройки и поддерживается сообществом.

Бесплатное, совместимое и производительное решение для виртуализации Windows-инфраструктуры: Hyper-V (Microsoft Hyper-V Server).
Hyper-V предлагает хорошую производительность для Windows VM, обеспечивает удобное управление и интеграцию с окружением Windows, а также бесплатно предоставляет базовые возможности виртуализации.

Рабочее окружение для тестирования на нескольких дистрибутивах Linux: VirtualBox.
VirtualBox предоставляет простое и удобное рабочее окружение для тестирования на нескольких дистрибутивах Linux. Это бесплатное ПО с хорошей совместимостью и обширным набором функций для тестирования.

Выбор системы управления виртуализацией зависит от требований каждого сценария, предпочтений, необходимых функций и уровня поддержки соответствующих платформ.

-----------------
##### 4.
Гетерогенная среда виртуализации, когда используются несколько систем управления виртуализацией (например, VMware, Hyper-V, KVM и т. д.) одновременно, может привести к ряду проблем и рисков:

Управление и консолидация:
Разные системы виртуализации имеют собственные интерфейсы и инструменты управления. Управление и мониторинг всей инфраструктуры может быть сложным из-за необходимости переключения между разными системами.

Совместимость и интеграция:
Возникают проблемы совместимости при перемещении виртуальных машин между различными платформами виртуализации. Это может вызвать проблемы при миграции или обмене данными между виртуальными средами.

Уровень навыков и поддержка:
Требуется широкий спектр знаний для управления несколькими платформами виртуализации, что может затруднить обучение и поддержку для ИТ-специалистов.

Безопасность и обновления:
Разные системы виртуализации имеют свои собственные уязвимости и обновления. Управление безопасностью и обновлениями становится сложнее из-за необходимости следить за несколькими поставщиками и версиями ПО.

Для минимизации рисков гетерогенной среды виртуализации важно:
  - Стандартизация: Стремитесь к стандартизации на одной платформе виртуализации. Это облегчит управление, снизит сложность и повысит эффективность.
  - Автоматизация и оркестрация: Использование инструментов автоматизации и оркестрации поможет управлять гетерогенной средой более эффективно.
  - Обучение и поддержка: Обучение сотрудников, чтобы они могли эффективно управлять разными системами виртуализации.

Относительно выбора гетерогенной среды виртуализации, это может быть необходимо по определенным причинам, таким как существующая легаси-инфраструктура, требования приложений или бюджетные ограничения. Однако, при наличии возможности, монолитная и стандартизированная среда виртуализации часто более предпочтительна, так как она облегчает управление и снижает риски разнообразия систем.