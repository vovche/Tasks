﻿Функция ПолучитьWIPЛимит(пСтатус) Экспорт
	пWIPЛимит = 0;
	
	#Если Сервер И НЕ Сервер тогда
		пСтатус = Справочники.узСтатусыЗадачи.ПустаяСсылка();
	#Конецесли	
	
	Если НЕ ЗначениеЗаполнено(пСтатус) Тогда
		Возврат пWIPЛимит;
	Конецесли;
	
	Если НЕ пСтатус.ИспользоватьWIPЛимит Тогда
		Возврат пWIPЛимит;
	Конецесли;
	
	пWIPЛимит = пСтатус.WIPЛимит;
	
	Возврат пWIPЛимит;
КонецФункции 