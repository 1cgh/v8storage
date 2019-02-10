﻿#Использовать "../.."
#Использовать asserts
#Использовать tempfiles
#Использовать fs

// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯУстанавливаюНаименованиеРасширенияКонфигурации");
	ВсеШаги.Добавить("ЯЗагружаюФайлКонфигурацииРасширенияВРасширение");
	ВсеШаги.Добавить("ЯКопируюТестовоеХранилищеРасширенияВоВременныйКаталог");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт

КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	ВременныеФайлы.Удалить();
КонецПроцедуры

// Я устанавливаю наименование расширения конфигурации "Расширение"
Процедура ЯУстанавливаюНаименованиеРасширенияКонфигурации(Знач ИмяРасширения) Экспорт

	ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");

	ХранилищеКонфигурации.УстановитьРасширениеХранилища(ИмяРасширения);

КонецПроцедуры


// Я загружаю файл конфигурации расширения "./tests/fixtures/1Cv8.cfe" в расширение "Расширение"
Процедура  ЯЗагружаюФайлКонфигурацииРасширенияВРасширение(Знач ПутьКФайлуКонфигурации,Знач ИмяРасширения) Экспорт

	ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");
	УправлениеКонфигуратором = ХранилищеКонфигурации.ПолучитьУправлениеКонфигуратором();

	УправлениеКонфигуратором.ЗагрузитьРасширениеИзФайла(ПутьКФайлуКонфигурации,ИмяРасширения);

КонецПроцедуры

//Я создаю файловое хранилище расширения "Расширение" с параметром подключения базы к хранилищу "Истина"
Процедура ЯСоздаюФайловоеХранилищеРасширенияСПараметромПодключенияБазыКхранилищу(Знач ИмяРасширения,Знач ПодключитьсяКхранилищу) Экспорт

	ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");
	ХранилищеКонфигурации.СоздатьХранилищеКонфигурации(ПодключитьсяКхранилищу);

КонецПроцедуры

//Я копирую тестовое хранилище расширения во временный каталог
Процедура ЯКопируюТестовоеХранилищеРасширенияВоВременныйКаталог() Экспорт

    ВременныйКаталог = БДД.ПолучитьИзКонтекста("ВременныйКаталог");
    ФС.КопироватьСодержимоеКаталога("./tests/fixtures/storage_ext", ВременныйКаталог);
КонецПроцедуры
