# Oystercard

This is a project to emulate a Oystercard system in Ruby.

This project was created to practice Test Driven Development with RSpec, and Object Oriented Principles including encapsulation, highly cohesion and low coupling, single responsibility and dependency injection.

The project is incomplete, at this point the Oystercard class is not yet working using the JourneyList class.

## User Stories

> In order to use public transport  
> As a customer  
> I want money on my card

> In order to keep using public transport  
> As a customer  
> I want to add money to my card

> In order to protect my money  
> As a customer  
> I don't want to put too much money on my card

> In order to pay for my journey  
> As a customer  
> I need my fare deducted from my card

> In order to get through the barriers  
> As a customer  
> I need to touch in and out

> In order to pay for my journey  
> As a customer  
> I need to have the minimum amount for a single journey

> In order to pay for my journey  
> As a customer  
> I need to pay for my journey when it's complete

> In order to pay for my journey  
> As a customer  
> I need to know where I've travelled from

> In order to know where I have been  
> As a customer  
> I want to see to all my previous trips

> In order to know how far I have travelled  
> As a customer  
> I want to know what zone a station is in

> In order to be charged correctly  
> As a customer  
> I need a penalty charge deducted if I fail to touch in or out

> In order to be charged the correct amount  
> As a customer  
> I need to have the correct fare calculated

## Class Diagram Model

![Class Diagram][Class Diagram]


<!-- Links -->

[Class Diagram]: https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cdEpvdXJuZXlMaXN0IFwiMVwiIDwtLSBcIjFcIiBPeXN0ZXJjYXJkIDogY29udGFpbnNcblx0Sm91cm5leSBcIipcIiA8LS0gXCIxXCIgSm91cm5leUxpc3QgOiBjb250YWluc1xuXHRTdGF0aW9uIC0tIE95c3RlcmNhcmQgOiBhcmd1bWVudFxuXHRcblx0Y2xhc3MgU3RhdGlvbntcblx0XHQrbmFtZTogc3RyXG5cdFx0K3pvbmUgaW50XG5cblx0XHQraW5pdGlhbGl6ZShuYW1lLCB6b25lKVxuXHR9XG5cbiAgY2xhc3MgT3lzdGVyY2FyZHtcblx0XHQrYmFsYW5jZTogaW50XG5cdFx0K2pvdXJuZXlfaGlzdG9yeTogYXJyYXlcblx0XHQrY3VycmVudF9qb3VybmV5OiBKb3VybmV5XG5cblx0XHQrdG9wdXAobW9uZXkpXG5cdFx0K2luX2pvdXJuZXk_KClcblx0XHQrdG91Y2hfaW4oZW50cnlfc3RhdGlvbilcblx0XHQrdG91Y2hfb3V0KGV4aXRfc3RhdGlvbilcblx0XHQtcmVjb3JkX2pvdXJuZXkoKVxuXHRcdC1kZWR1Y3QoZmFyZSlcblx0XHQtdW5kZXJfbWluaW11bV9iYWxhbmNlPygpXG5cdFx0LWV4Y2VlZF9saW1pdD8obW9uZXkpXG5cdH1cblxuXHRjbGFzcyBKb3VybmV5e1xuXHRcdC1lbnRyeV9zdGF0aW9uOiBTdGF0aW9uXG5cdFx0LWV4aXRfc3RhdGlvbjogU3RhdGlvblxuXG5cdFx0LWNhbGN1bGF0ZV9mYXJlKGVudHJ5X3N0YXRpb24sIGV4aXRfc3RhdGlvbilcblx0fVxuXG5cdGNsYXNzIEpvdXJuZXlMaXN0e1xuXHRcdCtpbml0aWFsaXplKGpvdXJuZXlfY2xhc3MpXG5cblx0XHQram91cm5leV9oaXN0b3J5OiBhcnJheVxuXHRcdCtqb3VybmV5X2NsYXNzOiBKb3VybmV5XG5cdFx0K2luX2pvdXJuZXk6IGJvb2xcblxuXHRcdCtzdGFydF9qb3VybmV5KHN0YXRpb24pXG5cdFx0K3N0b3Bfam91cm5leShzdGF0aW9uKVxuXHRcdCtpbl9qb3VybmV5PygpXG5cdH1cdFx0XHQiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ