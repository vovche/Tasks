﻿
&После("ОтправитьУведомлениеНаПочтуИсполнителю")
Процедура Аська_ОтправитьУведомлениеНаПочтуИсполнителю(НастройкиСобытий, СобытияВИстории)
	Если НЕ ЗначениеЗаполнено(Исполнитель) Тогда
		Возврат;
	Конецесли;
	
	ТекПользователь = Пользователи.ТекущийПользователь(); 
	
	Если ТекПользователь = Исполнитель И НЕ ТекПользователь.узОтправлятьУведомленияОДействияхПользователяЕмуНаПочту Тогда			
		Возврат;
	Конецесли;	
	
	ТЗСобытияВИсторииДляУведомлений = СобытияВИстории.ТЗСобытияВИсторииДляУведомлений;
	ВсегоСобытий = ТЗСобытияВИсторииДляУведомлений.Количество();
	Если ВсегоСобытий = 0 Тогда
		Возврат;
	Конецесли;
	
	ВТДопПараметры = Новый Структура();
	ВТДопПараметры.Вставить("ЭтоОтправкаИсполнителю",Истина);
	ВТДопПараметры.Вставить("НастройкиСобытий",НастройкиСобытий);
	РезультатФункции = ПолучитьТемаПисьмаСобытие(ВТДопПараметры,СобытияВИстории);
	
	Если НЕ РезультатФункции.НеобходимоОтправитьУведомление Тогда
		Возврат;
	КонецЕсли;	
	
	ПараметрыПисьма = ПолучитьПараметрыПисьма(РезультатФункции);
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ВажностьЗадачи",Важность);
	ДопПараметры.Вставить("ТекстПисьма",ПараметрыПисьма.ТекстПисьма);
	ДопПараметры.Вставить("ТемаПисьма",ПараметрыПисьма.ТемаПисьма);
	ДопПараметры.Вставить("ПользовательКому",Исполнитель);
	
	szАськаСервер.ВыполнитьРассылку(ДопПараметры);
	
КонецПроцедуры

&После("ОтправитьУведомлениеНаПочтуСтаромуИсполнителю")
Процедура Аська_ОтправитьУведомлениеНаПочтуСтаромуИсполнителю(НастройкиСобытий, СобытияВИстории)
	СтарыйИсполнитель = СобытияВИстории.СтарыйИсполнитель;
	
	Если НЕ ЗначениеЗаполнено(СтарыйИсполнитель) Тогда
		Возврат;
	Конецесли;
	
	ТекПользователь = Пользователи.ТекущийПользователь(); 
	
	Если ТекПользователь = СтарыйИсполнитель И НЕ ТекПользователь.узОтправлятьУведомленияОДействияхПользователяЕмуНаПочту Тогда			
		Возврат;
	Конецесли;	
	
	Если Исполнитель = СтарыйИсполнитель Тогда
		Возврат;
	КонецЕсли;
	
	ТЗСобытияВИсторииДляУведомлений = СобытияВИстории.ТЗСобытияВИсторииДляУведомлений;
	ВсегоСобытий = ТЗСобытияВИсторииДляУведомлений.Количество();
	Если ВсегоСобытий = 0 Тогда
		Возврат;
	Конецесли;
	
	ВТДопПараметры = Новый Структура();
	ВТДопПараметры.Вставить("ЭтоОтправкаСтаромуИсполнителю",Истина);
	ВТДопПараметры.Вставить("НастройкиСобытий",НастройкиСобытий);
	РезультатФункции = ПолучитьТемаПисьмаСобытие(ВТДопПараметры,СобытияВИстории);		
		
	Если НЕ РезультатФункции.НеобходимоОтправитьУведомление Тогда
		Возврат;
	КонецЕсли;	
	
	ПараметрыПисьма = ПолучитьПараметрыПисьма(РезультатФункции);
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ВажностьЗадачи",Важность);
	ДопПараметры.Вставить("ТекстПисьма",ПараметрыПисьма.ТекстПисьма);
	ДопПараметры.Вставить("ТемаПисьма",ПараметрыПисьма.ТемаПисьма);
	ДопПараметры.Вставить("ПользовательКому",СтарыйИсполнитель);
	
	szАськаСервер.ВыполнитьРассылку(ДопПараметры);
	
КонецПроцедуры

&После("ОтправитьУведомлениеНаПочтуНаблюдателям")
Процедура Аська_ОтправитьУведомлениеНаПочтуНаблюдателям(НастройкиСобытий, СобытияВИстории)
	ТЗСобытияВИсторииДляУведомлений = СобытияВИстории.ТЗСобытияВИсторииДляУведомлений;
	ВсегоСобытий = ТЗСобытияВИсторииДляУведомлений.Количество();
	Если ВсегоСобытий = 0 Тогда
		Возврат;
	Конецесли;
	
	МассивНаблюдателей = ПолучитьМассивНаблюдателей();
	Если МассивНаблюдателей.Количество() = 0 Тогда
		Возврат;
	Конецесли;
	
		
	ВТДопПараметры = Новый Структура();
	ВТДопПараметры.Вставить("ЭтоОтправкаНаблюдателям",Истина);
	ВТДопПараметры.Вставить("НастройкиСобытий",НастройкиСобытий);
	РезультатФункции = ПолучитьТемаПисьмаСобытие(ВТДопПараметры,СобытияВИстории);	
		
	Если НЕ РезультатФункции.НеобходимоОтправитьУведомление Тогда		
		Возврат;
	КонецЕсли;	
	
	ПараметрыПисьма = ПолучитьПараметрыПисьма(РезультатФункции);
	
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ВажностьЗадачи",Важность);
	ДопПараметры.Вставить("ТекстПисьма",ПараметрыПисьма.ТекстПисьма);
	ДопПараметры.Вставить("ТемаПисьма",ПараметрыПисьма.ТемаПисьма);
	ДопПараметры.Вставить("Статус",Статус);
	ДопПараметры.Вставить("МассивПользователейКому",МассивНаблюдателей);
	
	szАськаСервер.ВыполнитьРассылку(ДопПараметры);
	
КонецПроцедуры


