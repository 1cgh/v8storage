# language: ru

Функционал: Формирование файла списка объектов конфигурации
    Как разработчик
    Я хочу иметь возможность формировать список файлов объектов конфигурации без использования сторонних библиотек
    Чтобы мочь автоматизировать больше рутинных действий на OneScript

Контекст:
    Допустим Я создаю новый объект МенеджерХранилищаКонфигурации
    И Я создаю новый объект СписокОбъектовКонфигурации
    И Я создаю временный каталог и сохраняю его в контекст
    И Я копирую тестовое хранилище расширения во временный каталог
    И Я сохраняю значение временного каталога в переменной "КаталогХранилищаКонфигурации"
    И Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ВременнаяБаза"
    И Я создаю временную базу в каталоге из переменной "ВременнаяБаза"
    И я устанавливаю контекст выполнения конфигуратора
    И Я устанавливаю наименование расширения конфигурации "Расширение"
    И Я загружаю файл конфигурации "./tests/fixtures/1Cv8.cf" в базу данных
    И  Я загружаю файл конфигурации расширения "./tests/fixtures/1Cv8.cfe" в расширение "Расширение"
    И Я устанавливаю каталог хранилища из переменной "КаталогХранилищаКонфигурации"
    И Я устанавливаю параметры авторизации пользователя "Администратор" и пароль ""
    И Я подключаю базу к хранилищу
    И Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "КаталогВыгрузки"
    И Я выгружаю конфигурацию в каталог из переменной "КаталогВыгрузки"

Сценарий: Чтение списка файлов из папки с исходниками
    Допустим Я формирую список объектов конфигурации для каталога из переменной "КаталогВыгрузки"
    И Я записываю список объектов конфигурации во временный файл и сохраняю значение в переменной "ФайлСпискаОбъектов"
    Когда Я выполняю захват объектов в хранилище конфигурации по файлу списка объектов
    Тогда Все объекты успешно захвачены
    И Я отменяю захват в хранилище

Сценарий: Захват корня хранилища без подчиненных по файлу объектов
    Допустим Я добавляю в список объектов захват корня конфигурации с включением подчиненных "Ложь"
    И Я записываю список объектов конфигурации во временный файл и сохраняю значение в переменной "ФайлСпискаОбъектов"
    Когда Я выполняю захват объектов в хранилище конфигурации по файлу списка объектов
    Тогда Все объекты успешно захвачены
    И Я отменяю захват в хранилище

Сценарий: Захват корня хранилища с подчиненными объектами по файлу объектов
    Допустим Я добавляю в список объектов захват корня конфигурации с включением подчиненных "Истина"
    И Я записываю список объектов конфигурации во временный файл и сохраняю значение в переменной "ФайлСпискаОбъектов"
    Когда Я выполняю захват объектов в хранилище конфигурации по файлу списка объектов
    Тогда Все объекты успешно захвачены
    И Я отменяю захват в хранилище