/*
Данный скрипт позволяет харнить скрипты на серверной части и воспроизводить на клиенте.
*/

НА СЕРВЕРЕ

CLIENT_FUNCTION_NAMES = [
  'Client_Func_1',
  'Client_Func_2'
];

Client_Func_1 = call compileFinal preprocessFileLineNumbers('Client_Func_1.sqf');
Client_Func_2 = call compileFinal preprocessFileLineNumbers('Client_Func_2.sqf');


// пересылаем массив с именами клиентских функций
_pcid publicVariableClient "CLIENT_FUNCTION_NAMES";

// пересылаем клиенту все клиентские функции (они скомпилированы через compileFinal, чтобы их нельзя было переопределить)
{
 pcid publicVariableClient x;
} foreach CLIENT_FUNCTION_NAMES;





НА КЛИЕНТЕ

// ожидаем получения массива с именами клиентских функций
waitUntil{!isNil "CLIENT_FUNCTION_NAMES"};

// foreach CLIENT_FUNCTION_NAMES - дожидаемся инициализации всех клиентских функций
{
 waitUntil{!isNil _x};
} foreach CLIENT_FUNCTION_NAMES;
