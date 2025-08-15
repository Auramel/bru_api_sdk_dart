import 'dart:developer';

import 'package:bru_api_sdk_dart/bru_api_sdk_dart.dart';
import 'package:bru_api_sdk_dart/src/config/models.dart';
import 'package:bru_api_sdk_dart/src/interceptors/talker_interceptor.dart';

void main() async {
  // Инициализация API клиента
  final BruApiClient client = BruApiClient.init(
    baseUrl: Uri.parse('https://example.com/'),
    enterUrl: 'https://enter-example.com/',
    clientSecret: 'secret',
    clientId: 'client id',
    scope: 'scope',
    bidUrl: 'bid',
    interceptors: [
      TalkerInterceptor(), // Необязательный интерцептор для логирования
    ],
  );

  // Установка кастомного порта (необязательно)
  client.rest.port = 81;

  // Авторизация пользователя
  await client.login(
    username: 'usernamse', // Имя пользователя
    password: 'password', // Пароль
  );

  // Получение данных текущего пользователя
  log((client.me?.lastName).toString());

  // Поиск заказов
  await client.rest.search(Models.customerOrdersSearch, '1');

  // Удаление заказа по ID
  await client.rest.delete(Models.customerOrders, 81943);

  // Получение заказа по ID
  await client.rest.get(Models.customerOrders, {
    'id': 81943,
  });

  // Выполнение GraphQL-запроса
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
}
