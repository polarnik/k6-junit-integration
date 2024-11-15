---
marp: true
title: Как количество тестов производительности переходит в качество
description: Allure.TestOps, JUnit, k6, Grafana
theme: codetalks
template: bespoke
paginate: false
_paginate: false
unknown-size: true

---

<!-- _class: lead
-->

# Как _количество_ тестов производительности переходит в __качество__


---

<!-- _class: main -->


# Спустя годы попыток


---


<!-- _class: main -->


# Спустя годы попыток

# отчеты по нагрузке


---

<!-- _class: main -->


# Спустя годы попыток

# отчеты по нагрузке

# интересны читателям

---

<!-- _class: lead -->


# Спустя годы попыток

# _отчеты_ __по нагрузке__

# __интересны__ _читателям_


---
<!-- _class: main -->

## __Автотесты__

---
<!-- _class: main -->

## __Автотесты__ 
## производительности.

---
<!-- _class: main -->

## __Автотесты__ 
## производительности,

# которых _много_.


---
<!-- _class: main -->

## __Автотесты__ 
## производительности,

# которых _много_, 
## и это __хорошо__


---

<!-- _class: about -->

![w:400px h:400px](img/foto.png)

## Смирнов Вячеслав
## Ускоряю _miro.com_
### Развиваю __@qa_load__

---

# План

1) Чем сложна нагрузка?

1) Как понять _результат_ теста за секунду?
1) Как понять __сотню__ _результатов_ тестов за минуту?
1) Что дает Test Management System (_TMS_)?
1) Что дает _Test Framework_ (__JUnit__) писателю?
1) Почему _больше_ тестов — __лучше__?

---


<!-- _class: lead -->

# 1️⃣ Чем сложна нагрузка?


---

<!-- _class: main -->

# Просто ли 
# __написать__ 
# нагрузочные тесты?

---

![bg w:90%](img/load.test.1.png)

---

![bg w:90%](img/load.test.2.png)

---

![bg w:90%](img/load.test.3.png)

---

![bg w:90%](img/load.test.4.png)

---

![bg w:90%](img/load.test.png)

---

<!-- _class: main -->


# __Непростые__ 
# тесты



---

<!-- _class: main -->


# Просто ли 
# _понять отчет_ 
# по нагрузке?

---

![bg h:90%](img/report.1.png)


---

![bg h:90%](img/report.2.png)

---

![bg h:90%](img/report.3.png)

---


<!-- _class: main -->


# __Непростые__ 
# тесты и
# результаты

---


<!-- _class: main -->


# __Непростые__
# тесты и
# _результаты_

---


<!-- _class: lead -->


# Людям 
# _трудно понимать_
# __результаты нагрузки__

---


<!-- _class: lead -->

# 2️⃣ Как понять 
# _результат_ теста 
# за секунду?

---

# Результат _одного_ __теста__: 

# ✅ OK
# 🛑 Fail

---

# Результат _одного_ __теста__:

# ✅ OK
# 🛑 Fail
# ⚠️ не получилось проверить

---

# Результат _набора_ __тестов__:

# ✅ 15
# ✅ 10 🛑 5
# 🛑 15
# ⚠️ 15

---

# Результат _набора_ __тестов__:

# ✅ 15 — _все хорошо_ 
# ✅ 10 🛑 5
# 🛑 15
# ⚠️ 15

---

# Результат _набора_ __тестов__:

# ✅ 15
# ✅ 10 🛑 5  — _кое-что сломалось_
# 🛑 15
# ⚠️ 15

---

# Результат _набора_ __тестов__:

# ✅ 15
# ✅ 10 🛑 5
# 🛑 15   — _все плохо_
# ⚠️ 15

---

# Результат _набора_ __тестов__:

# ✅ 15
# ✅ 10 🛑 5
# 🛑 15
# ⚠️ 15   — _не удалось проверить_



---

![bg h:90%](img/report.2.png)


---

![bg h:90%](img/report.ok.1.png)

---

![bg h:90%](img/report.ok.2.png)

---

![bg h:90%](img/report.ok.3.png)

---

<!-- _class: lead -->

## В результате важны
# __статус__: ✅ 🛑
## и __описание__: сервис, версия, ...

---


<!-- _class: lead -->

# 3️⃣ Как 
# сделать _анализ_ 
# __сотни__ результатов?

---

# Что с сервисами?


| Service       | Version 1.2.3 | Version 1.2.4 |
|:--------------|--------------:|--------------:|
| API Service   |          ✅250 |         ✅242 🛑8 |

---

# Что с сервисами?


| Service         | Version 1.2.3 | Version _1.2.4_ |
|:----------------|--------------:|----------------:|
| __API Service__ |          ✅250 |        ✅242 🛑8 |

## В __API Service__ что-то сломалось в версии _1.2.4_

---

# _Кликаем_ по Service __API Service__


| Service         | Version 1.2.3 |   Version 1.2.4 |
|:----------------|--------------:|----------------:|
| __API Service__ |          ✅250 |        ✅242 🛑8 |

## и переходим в детали

---

# Что с API?

| Endpoint     | Version 1.2.3 | Version 1.2.4 |
|:-------------|--------------:|--------------:|
| GET /project |           ✅50 |       ✅42 🛑8 |
| GET /users   |          ✅100 |          ✅100 |
| GET /account |          ✅100 |          ✅100 |

---

# Сбой в __GET /project__

| Endpoint         | Version 1.2.3 |   Version 1.2.4 |
|:-----------------|--------------:|----------------:|
| __GET /project__ |           ✅50 |       ✅42 🛑8 |
| GET /users       |          ✅100 |          ✅100 |
| GET /account     |          ✅100 |          ✅100 |


---

# _Кликаем_ по __GET /project__

| Endpoint          | Version 1.2.3 |   Version 1.2.4 |
|:------------------|--------------:|----------------:|
| __GET /project__  |            ✅50 |       ✅42 🛑8 |
| GET /users        |          ✅100 |          ✅100 |
| GET /account      |          ✅100 |          ✅100 |


---

# Что не так с __GET /project__?

| Endpoint     | Payload             | Version 1.2.3 | Version 1.2.4 |
|:-------------|:--------------------|--------------:|--------------:|
| GET /project | ?fields=name        |           ✅10 |        ✅2 🛑8 |
| GET /project | ?fields=items       |           ✅20 |           ✅20 |
| GET /project | ?fields=permissions |           ✅20 |           ✅20 |


---

# Поле __name__ замедлилось

| Endpoint     | Payload             | Version 1.2.3 |  Version 1.2.4 |
|:-------------|:--------------------|--------------:|---------------:|
| GET /project | ?fields=__name__    |           ✅10 |        ✅2 🛑8 |
| GET /project | ?fields=items       |           ✅20 |           ✅20 |
| GET /project | ?fields=permissions |           ✅20 |           ✅20 |

---

# _Кликаем_ по payload __name__ ...

| Endpoint     | Payload             | Version 1.2.3 |  Version 1.2.4 |
|:-------------|:--------------------|--------------:|---------------:|
| GET /project | ?fields=__name__    |           ✅10 |        ✅2 🛑8 |
| GET /project | ?fields=items       |           ✅20 |           ✅20 |
| GET /project | ?fields=permissions |           ✅20 |           ✅20 |

---

# Проанализировали результаты

* ### Service: _API Service_
* ### Endpoint: __GET /project__
* ### Payload: _?fields=name_
* ### Version: __1.2.4__

---

# Проанализировали результаты

- ### Service: _API Service_
- ### Endpoint: __GET /project__
- ### Payload: _?fields=name_
- ### Version: __1.2.4__

# за несколько кликов

---


<!-- _class: lead -->

# _Таблицы_ 
# преобразуют статусы в
# _аналитический отчет_

---

<!-- _class: lead -->

# 4️⃣ Что дает 
# Test Management System (_TMS_)?

---

<!-- _class: main -->

# Это __подход__ 
# для _разных_ TMS: 
## Allure, Qase, TestRail, TestIT, самодельных ... 

---

<!-- _class: main -->

# Это __подход__
# для _разных_ TMS:
## __Allure__, Qase, TestRail, TestIT, самодельных ...


---

![bg h:90%](img/report.ok.3.png)


---

![bg h:90%](img/report.fail.1.png)

---

# Можно сделать сводный отчет

| Endpoint     | Payload             | Version 1.2.3 |  Version 1.2.4 |
|:-------------|:--------------------|--------------:|---------------:|
| GET /project | ?fields=__name__    |           ✅10 |        ✅2 🛑8 |
| GET /project | ?fields=items       |           ✅20 |           ✅20 |
| GET /project | ?fields=permissions |           ✅20 |           ✅20 |

---

# Где есть _группировка_ по

* ## Service
* ## Endpoint
* ## Payload
* ## Version
* ## ...

| Endpoint     | Payload             | Version 1.2.3 | Version 1.2.4 |
|:-------------|:--------------------|--------------:|--------------:|
| GET /project | ?fields=name        |           ✅10 |        ✅2 🛑8 |
| GET /project | ?fields=items       |           ✅20 |           ✅20 |
| GET /project | ?fields=permissions |           ✅20 |           ✅20 |


# по __каждому результату__ теста

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

![bg w:100% opacity:100%](img/allure.behavior-based-hierarchy.annotation.api.png)

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

# _Behavior_: Epic / Feature / Story

![bg w:100% opacity:90%](img/allure.behavior-based-hierarchy.annotation.api.png)

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

# Behavior: Epic / Feature / Story

# _Annotations_ API

![bg w:100% opacity:80%](img/allure.behavior-based-hierarchy.annotation.api.png)

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

# Behavior: Epic / Feature / Story

# Annotations API


```groovy
@Epic("Web interface")
@Feature("Essential features")
@Story("Authentication")
```

![bg w:100% opacity:50%](img/allure.behavior-based-hierarchy.annotation.api.png)

---


![bg w:100%](img/allure.behavior-based-hierarchy.annotation.api.png)


---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

![bg w:100% opacity:100%](img/allure.behavior-based-hierarchy.runtime.api.png)

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

# _Behavior_: Epic / Feature / Story


![bg w:100% opacity:90%](img/allure.behavior-based-hierarchy.runtime.api.png)

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

# Behavior: Epic / Feature / Story

# _Runtime_ API

![bg w:100% opacity:40%](img/allure.behavior-based-hierarchy.runtime.api.png)

---

### __[allurereport.org/docs/junit5/#organize-tests](https://allurereport.org/docs/junit5/#organize-tests)__

# Behavior: Epic / Feature / Story

# Runtime API

```groovy
Allure.epic("Web interface");
Allure.feature("Essential features");
Allure.story("Authentication");
```
![bg w:100% opacity:20%](img/allure.behavior-based-hierarchy.runtime.api.png)

---

![bg w:100%](img/allure.behavior-based-hierarchy.runtime.api.png)


---

### __[allurereport.org/docs/gettingstarted-navigation](https://allurereport.org/docs/gettingstarted-navigation/#behavior-based-hierarchy)__

![bg w:100% opacity:50%](img/allure.behavior-based-hierarchy.png)


---

# Поля по умолчанию

### __[docs.qameta.io/allure-testops/briefly/test-cases/labels/](https://docs.qameta.io/allure-testops/briefly/test-cases/labels/#list-of-standard-labels-used-in-allure-framework)__

* parentSuite, suite, subSuite
* testClass, testMethod
* _epic_, _feature_, _story_
* owner, lead
* thread
* layer
* host

---

# Поля по умолчанию

### __[docs.qameta.io/allure-testops/briefly/test-cases/labels/](https://docs.qameta.io/allure-testops/briefly/test-cases/labels/#list-of-standard-labels-used-in-allure-framework)__

- parentSuite, suite, subSuite
- testClass, testMethod
- _epic_, _feature_, _story_
- owner, lead
- thread
- layer
- host

![bg w:100% opacity:60%](img/allure.testops.standart.fields.png)


---

# Задать можно _любые_ метки (__label__)


---

# _service_ (сервис)

```groovy
Allure.label("service",  "API");                   
```


---

# _endpoint_ (метод сервиса)

```java
Allure.label("service",  "API");                   
```
```groovy
Allure.label("endpoint", "GET /projects");         
```


---

# _payload_ (параметры)

```java
Allure.label("service",  "API");                   
Allure.label("endpoint", "GET /projects");
```
```groovy
Allure.label("payload",  "fields=item");           
```


---

# _dataset_ (тестовые данные)

```java
Allure.label("service",  "API");                   
Allure.label("endpoint", "GET /projects");
Allure.label("payload",  "fields=item");
```
```groovy
Allure.label("dataset",  "enterprise 10000 users");
```


---

# _version_ (версию сервиса)

```java
Allure.label("service",  "API");                   
Allure.label("endpoint", "GET /projects");
Allure.label("payload",  "fields=item");
Allure.label("dataset",  "enterprise 10000 users");
```
```groovy
Allure.label("version",  getServerVersion());      
```


---

# _environment_ (стенд)

```java
Allure.label("service",  "API");                   
Allure.label("endpoint", "GET /projects");
Allure.label("payload",  "fields=item");
Allure.label("dataset",  "enterprise 10000 users");
Allure.label("version",  getServerVersion());
```
```groovy
Allure.label("environment",     "production");     
```


---

# _server-location_ (размещение)

```java
Allure.label("service",  "API");                   
Allure.label("endpoint", "GET /projects");
Allure.label("payload",  "fields=item");
Allure.label("dataset",  "enterprise 10000 users");
Allure.label("version",  getServerVersion());
Allure.label("environment",     "production");
```
```groovy
Allure.label("server-location", "USA");            
```

---

# _client-location_ (параметры клиента)

```java
Allure.label("service",  "API");                   
Allure.label("endpoint", "GET /projects");
Allure.label("payload",  "fields=item");
Allure.label("dataset",  "enterprise 10000 users");
Allure.label("version",  getServerVersion());
Allure.label("environment",     "production");
Allure.label("server-location", "USA");
```
```groovy
Allure.label("client-location", "Europe");         
```
 
---

# Задать можно _любые_ метки (__label__)

```groovy
Allure.label("service",  "API");
Allure.label("endpoint", "GET /projects");
Allure.label("payload",  "fields=item");
Allure.label("dataset",  "enterprise 10000 users");
Allure.label("version",  getServerVersion());
Allure.label("environment",     "production");
Allure.label("server-location", "USA");
Allure.label("client-location", "Europe");
...
```


---

# В __Annotation__ API

# значения всегда _задаются в коде_


```groovy
@Endpoint("GET /projects");                  
```

---

# В __Runtime__ API
# значения могут быть _константами_

```groovy
Allure.label("version", "1.2.3");            
```

---

# В __Runtime__ API
# значения могут быть константами

```groovy
Allure.label("version", "1.2.3");            
```

# и _функциями_ тоже

```groovy
Allure.label("version",  getServerVersion());
```


---

# Как _сгруппировать_ статусы?


| Endpoint     | Payload             | Version 1.2.3 | Version 1.2.4 |
|:-------------|:--------------------|--------------:|--------------:|
| GET /project | ?fields=name        |           ✅10 |        ✅2 🛑8 |
| GET /project | ?fields=items       |           ✅20 |           ✅20 |
| GET /project | ?fields=permissions |           ✅20 |           ✅20 |



---

# Как _сгруппировать_ статусы?

### __API__ Export Launch _POST /api/rs/export/testresult/csv_

---

# Как _сгруппировать_ статусы?

### __API__ Export Launch _POST /api/rs/export/testresult/csv_

![bg w:100% opacity:60%](img/allure.testops.export.csv.png)

---

![bg w:100%](img/allure.testops.export.csv.png)

---

![bg w:100%](img/allure.testops.export.csv.select.jpg)


---

# Как _сгруппировать_ статусы?

### __API__ Export Launch _POST /api/rs/export/testresult/csv_

![bg w:100% opacity:60%](img/allure.testops.export.csv.select.jpg)

---

# Как _сгруппировать_ статусы?

### API Export Launch POST /api/rs/export/testresult/csv
### _CSV_ загружается в __InfluxDB__ / VictoriaMetrics / ...

---

# Как _сгруппировать_ статусы?

### API Export Launch POST /api/rs/export/testresult/csv
### CSV загружается в InfluxDB / VictoriaMetrics / ...
### __Grafana__ строит _аналитический_ отчет

---

# Как _сгруппировать_ статусы?

### API Export Launch POST /api/rs/export/testresult/csv
### CSV загружается в InfluxDB / VictoriaMetrics / ...
### Grafana строит аналитический отчет
### __Grafana__ показывает _детали_

---

# Как _сгруппировать_ статусы?

### __API__ Export Launch _POST /api/rs/export/testresult/csv_
### _CSV_ загружается в __InfluxDB__ / VictoriaMetrics / ...
### __Grafana__ строит _аналитический_ отчет
### __Grafana__ показывает _детали_


---

# Анализ обычного отчета: _2+ часа_


---

# Анализ обычного отчета: 2+ часа

# Анализ __аналитики__: _от 10-минут_


---

# Анализ обычного отчета: 2+ часа

# Анализ аналитики: от 10-минут

# __Выгодно__ с _12-го теста_

---

<!-- _class: main -->

# _Таблицы_ в __Grafana__ дают читателю __легкость__ анализа

---

# А также в __Allure TestOps__ легко

---

# А также в Allure TestOps легко

# создать __дефект__ по _Fail_-тесту


---

# А также в Allure TestOps легко

# создать дефект по Fail-тесту

# и  за-__Mute__-ить (_игнорировать_) сбой

---

# А также в __Allure TestOps__ легко

# создать __дефект__ по _Fail_-тесту

# и  за-__Mute__-ить (_игнорировать_) сбой

---

<!-- _class: main -->

# Читатели 
# _не игнорируют_ 
# тесты по нагрузке

---

<!-- _class: main -->

# Читатели
# __правильно__ _игнорируют_
# тесты по нагрузке


---

<!-- _class: main -->

# Читатели
# __правильно__ (Issue)
# _игнорируют_ (Mute)


---

<!-- _class: lead -->

# Читателям 
# _нравится_
# простота


---

<!-- _class: lead -->

# 5️⃣ Что дает __JUnit__ писателю?

---

# _Allure_ интегрирован с __JUnit__ 5

* работает хорошо

* документация
* примеры

---

# В __JUnit__ понятная _структура_ проекта

---

# В JUnit понятная структура проекта
### __@BeforeAll__ для подачи _нагрузки_

* Запуск инструмента (_k6_/gatling/jmeter/...)

* Ожидание метрик  (_summary.json_)

---

# В JUnit понятная структура проекта
### @BeforeAll для подачи нагрузки

- Запуск инструмента (k6/gatling/jmeter/...)

- Ожидание метрик  (summary.json)

### __@Test__ для _проверок_

* Проверка метрик (_summary.json_)

* Добавление деталей (ссылки на _Grafana_)


---

# В __JUnit__ понятная _структура_ проекта
### __@BeforeAll__

- Запуск инструмента

- Ожидание метрик

### __@Test__

- Проверка метрик

- Добавление деталей

---

# __JUnit__ написан на _Java_

---

# __JUnit__ написан на _Java_

_Некоторые_ инструменты запустить __легко__
* __JMeter-Java-DSL__
* __Gatling__


---

# __JUnit__ написан на _Java_

Некоторые инструменты запустить легко
- JMeter-Java-DSL
- Gatling

_Любые_ инструменты запустить __возможно__

* В _Java_ есть __[java.testcontainers.org](https://java.testcontainers.org/)__
* Через __Test Containers__ можно запустить _Docker_-контейнеры
* Внутри _Docker_ можно запустить: __k6__, Taurus, ...

---

# __JUnit__ может запустить

- JMeter-Java-DSL

- Gatling
- Taurus
- k6
- _любой инструмент_

---


<!-- _class: main -->

# __JUnit__ 
# интегрирован в 
# среды разработки _IDE_

---


<!-- _class: main -->

# __JUnit__ 
# интегрирован в 
# системы сборки _CI_

---

![bg h:90%](img/arch.1.png)

---

![bg h:90%](img/arch.2.png)

---

![bg h:90%](img/arch.3.png)

---

![bg h:90%](img/arch.4.png)

---

![bg h:90%](img/arch.5.png)

---

![bg h:90%](img/arch.6.png)

---

![bg h:90%](img/arch.7.png)

---

![bg h:90%](img/arch.8.png)

---

# __Фреймворк__ задает структуру

---

# __JUnit__ задает структуру

---

# JUnit задает структуру

# _Статистика_ тестируется

---

# JUnit задает структуру

# k6 _summary.json_ тестируется

---

# JUnit задает структуру

# k6 summary.json тестируется

# Шлем _результаты_ в __хранилище__

---

# JUnit задает структуру

# k6 summary.json тестируется

# Шлем _CSV_ в __InfluxDB__

---

# JUnit задает структуру

# k6 summary.json тестируется

# Шлем CSV в InfluxDB

# __Grafana__ строит _отчет_

---

# __JUnit__ задает структуру

# k6 _summary.json_ тестируется

# Шлем _CSV_ в __InfluxDB__

# __Grafana__ строит _отчет_

---

<!-- _class: lead -->

# 6️⃣ Почему _больше_ тестов — лучше?

---

<!-- _class: main -->

# Много тестов 
# __увеличивают__ 
# тестовое покрытие

---

<!-- _class: main -->

# Много тестов 
# __стандартизируют__ 
# подачу нагрузки

---

<!-- _class: main -->

# Шаблонные тесты
# __генерируются__
# в _2024_-м году
---

<!-- _class: main -->

# __AI__ 
# легко _генерирует_ код 
# из списка параметров

---

![bg w:90%](img/generation.png)

---

<!-- _class: lead -->

# __Сотня__ простых тестов 
# _долго_ выполняется, 
# да _быстро_ понимается

---

## Понравилось? ✅OK  🛑Fail
### [@qa_load](https://t.me/qa_load)
### [@smirnovqa](https://t.me/smirnovqa)
### [github.com/polarnik/k6-junit-integration](https://github.com/polarnik/k6-junit-integration)
### [polarnik.github.io/k6-junit-integration/codetalks](https://polarnik.github.io/k6-junit-integration/codetalks/)
![bg w:90% right:35%](img/qr.png)


<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/java.min.js"></script>
<script>
document.querySelectorAll('code').forEach(el => {
  // then highlight each
  hljs.highlightElement(el);
});
</script>
