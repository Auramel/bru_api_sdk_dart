Описание API
============

API находится по адресу: [https://api-online.class365.ru](https://api-online.class365.ru)

Использование пакета как библиотеки
-----------------------------------

### Установка

    dart pub add bru_api_client

### Импорт

Теперь в вашем Dart-коде можно использовать:

    import 'package:bru_api_client/bru_api_client.dart';

Начало работы
-------------

### Инициализация API-клиента

    final BruApiClient client = BruApiClient.init(
      baseUrl: Uri.parse('https://example.com/'),
      enterUrl: 'https://enter-example.com/',
      clientSecret: 'secret',
      clientId: 'client id',
      scope: 'scope',
      bidUrl: 'bid',
      interceptors: [
        TalkerInterceptor(),
      ],
    );

### Авторизация

    await client.login(
      username: 'username',
      password: 'password',
    );

Выполнение запросов
-------------------

### Получение данных текущего пользователя

    log((client.me?.lastName).toString());

### Поиск заказов

    await client.rest.search(Models.customerOrdersSearch, '1');

### Удаление заказа по ID

    await client.rest.delete(Models.customerOrders, 81943);

### Получение заказа по ID

    await client.rest.get(Models.customerOrders, {
      'id': 81943,
    });

### GraphQL-запрос

    await client.rest.query('''
      query {
        organization(id: 75537) {
          id
          name
          vat_accounting
          taxation
          nds {
            id
            name
            value
          }
        }
      }
    ''');

**Важно:** не все модели поддерживают все методы. Подробнее в [официальной документации](https://api-online.class365.ru/api-polnoe/vvedenie_v_api_biznesru/228).

Модели
------

Модель указывает, с каким типом данных работает запрос (например, `customerOrders`, `retailchecks` и т.д.).

Список всех моделей доступен в [официальной документации](https://api-online.class365.ru/api-polnoe/vvedenie_v_api_biznesru/228).

Логирование
-----------

Для логирования используется [Talker](https://pub.dev/packages/talker).

Добавьте `TalkerInterceptor()` в список перехватчиков при инициализации клиента для отладки