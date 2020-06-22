﻿&НаСервере
Функция получитьИД(пользователь)
	Возврат Пользователь.szНомерАськи;
КонецФункции

&НаКлиенте
Процедура ПослатьСообщение(Команда)
	
	ИДКому=ПолучитьИД(Объект.Кому);
	НастройкаАськи = Новый Структура();
	НастройкаАськи.Вставить("ИД",ИДКому);
	
	МассивПолучателейАськи=новый Массив;
	МассивПолучателейАськи.Добавить(НастройкаАськи);
	
	ТекстДляОтправки=Объект.ТекстСообщения + Символы.ПС + Символы.ПС + Объект.МойТекст;
	
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ТекстСообщения",ТекстДляОтправки);
	ДопПараметры.Вставить("МассивПользователейДляОтправки",МассивПолучателейАськи);
	
	szАськаСервер.ВыполнитьРассылкуВАську(ДопПараметры);
	
	ЭтаФорма.Закрыть();
КонецПроцедуры
