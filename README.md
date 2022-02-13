# Faker::Russian

[[english_doc](doc/english_readme.md)]
[[Инструкции разработчикам](CONTRIBUTING.md)]
[![Gem Version](https://badge.fury.io/rb/faker-russian.svg)](http://badge.fury.io/rb/faker-russian)
[![Build Status](https://travis-ci.org/asiniy/faker-russian.svg?branch=master)](https://travis-ci.org/asiniy/faker-russian)
[![Code Climate](https://codeclimate.com/github/asiniy/faker-russian.png)](https://codeclimate.com/github/asiniy/faker-russian)

Генерация русских значений: ИНН, ОКПО, КПП и т.д.

* [БИК](http://ru.wikipedia.org/wiki/Банковский_идентификационный_код) (Faker::Russian.bik)
* [ИНН](http://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика) (Faker::Russian.inn)
* [ОКПО](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_предприятий_и_организаций) (Faker::Russian.okpo)
* [КПП](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт) (Faker::Russian.kpp)
* [ОГРН](http://ru.wikipedia.org/wiki/Основной_государственный_регистрационный_номер) (Faker::Russian.ogrn)
* [Корреспондентский счёт] (http://ru.wikipedia.org/wiki/Корреспондентский_счёт) (Faker::Russian.correspondent_account)
* [Расчётный счёт] (http://ru.wikipedia.org/wiki/Расчётный_счёт) (Faker::Russian.rs)
* [OKATO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_объектов_административно-территориального_деления) (Faker::Russian.okato)
* [СНИЛС](http://ru.wikipedia.org/wiki/Страховой_номер_индивидуального_лицевого_счёта) (Faker::Russian.snils)
* (TODO) [Значение паспорта](http://ru.wikipedia.org/wiki/Паспорт_гражданина_Российской_Федерации) (Faker::Russian.passport)
* [Кадастровый номер](https://ru.wikipedia.org/wiki/Кадастровый_номер) (Faker::Russian.cadastral_number)

Для проверки сгенерированных значений можешь использовать [gem 'validates_russian'](https://github.com/asiniy/validates_russian)

## Установка

Добавь в Gemfile

    gem 'faker-russian'

## Использование

### БИК

По умолчанию генерирует БИК со случайным номером региона по ОКАТО

``` ruby
  Faker::Russian.bik # => '0454954616'
```

Можно указывать номер региона по ОКАТО

``` ruby
  Faker::Russian.bik(okato_region_number: '40') # => '0440754281'
```

Также существуют последовательности, позволяющие получать псевдослучайные БИКи

``` ruby
  Faker::Russian.bik(sequence_number: 1) # => '0451491755'
  Faker::Russian.bik(sequence_number: 1) # => '0451491755'
```

### ИНН

Стандартно генерирует ИНН со случайным номером региона и со случайным типом (физ или юрлицо)

``` ruby
  Faker::Russian.inn # => '183501166447'
```

Можно указывать номер региона или тип

``` ruby
  Faker::Russian.inn(region_number: '78') # => '7857296996'
  Faker::Russian.inn(kind: :individual) # => '0229191612'
  Faker::Russian.inn(kind: :legal) # => '366582211439'
```

Также существуют последовательности, позволяющие получать одни и те же значения

``` ruby
  Faker::Russian.inn(sequence_number: 1) # => '0956860593'
  Faker::Russian.inn(sequence_number: 1) # => '0956860593'
```

### ОКПО

``` ruby
  Faker::Russian.okpo # => '57972160'
```

Также доступны последовательности:

``` ruby
  Faker::Russian.okpo(sequence_number: 1) # => '13410254'
  Faker::Russian.okpo(sequence_number: 1) # => '13410254'
```


### КПП

Генерирует КПП со случайным номером региона

``` ruby
  Faker::Russian.kpp # => '525601001'
```

Можно указать регион

``` ruby
  Faker::Russian.kpp(region_number: 78) # => '784101001'
```

Также можно использовать последовательности (не более 1000 - количество КПП ограничено):

``` ruby
  Faker::Russian.kpp(sequence_number: 1) # => '381201001'
  Faker::Russian.kpp(sequence_number: 1) # => '381201001'
```

### Корреспондентский счёт

Генерируется корреспондентский счет

```ruby
  Faker::Russian.correspondent_account
```

Также можно использовать последовательности (не более 1 000 000 000):

``` ruby
  Faker::Russian.correspondent_account(sequence_number: 1) # => '30100000000717354021'
  Faker::Russian.correspondent_account(sequence_number: 1) # => '30100000000717354021'
```

Можно указать БИК для которого генерируется счет:

```ruby
  Faker::Russian.correspondent_account(bik: '0440754281') # => '30100000341569331281'
```

### Расчетный счет

Генерирует Расчетный счет со случайным номером ОКВ

``` ruby
  Faker::Russian.rs # => '88638068000072709375'
```

Можно указать ОКВ

``` ruby
  Faker::Russian.rs(okv: 810) # => '86815810000597174799'
```

Также можно использовать последовательности (не более 1 000 000 000):

``` ruby
  Faker::Russian.rs(sequence_number: 1) # => '98539706000946286476'
  Faker::Russian.rs(sequence_number: 1) # => '98539706000946286476'
```

### ОКАТО

Генерирует ОКАТО со случайным номером региона и случайной длиной

``` ruby
  Faker::Russian.okato # => '849012471'
```

Можно указать регион по классификации окато

``` ruby
  Faker::Russian.okato(okato_region_number: 25) # => '251'
```

Можно указать длину ОКАТО:

``` ruby
  Faker::Russian.okato(length: 3) # => '251'
  Faker::Russian.okato(length: 6) # => '443758'
  Faker::Russian.okato(length: 9) # => '849012471'
```

Также можно использовать последовательности:

``` ruby
  Faker::Russian.okato(sequence_number: 1) # => '517'
  Faker::Russian.okato(sequence_number: 1) # => '517'
```

### СНИЛС

Генерирует 11-ти значный СНИЛС

``` ruby
  Faker::Russian.snils # => '15200583517'
```

Также можно использовать последовательности:

``` ruby
  Faker::Russian.snils(sequence_number: 1) # => '71735402183'
  Faker::Russian.snils(sequence_number: 1) # => '71735402183'
```

## Кадастровый номер

Генерируем случайный кадастровый номер

```ruby
  Faker::Russian.cadastral_number # => 41:16:8960136:44567
```

Можно указать кадастровый округ. Список кадастровых округов можно посмотреть [тут](http://www.consultant.ru/document/cons_doc_LAW_198788/77071e4c1462d21246476fac26647d08a6d4c298/).

Округ с номером "0" - "Общероссийский" кадастровый округ.

```ruby
  Faker::Russian.cadastral_number(district: 61) # => 61:16:8960136:44567
  Faker::Russian.cadastral_number(district: 1)  # => 01:16:8960136:44567
```

Можно указать кадастровый район.

Район с номером '0' - "Условный" кадастровый район.

```ruby
  Faker::Russian.cadastral_number(area: 2)  # => 41:02:8960136:44567
  Faker::Russian.cadastral_number(area: 61) # => 41:61:8960136:44567
```

Можно указать кадастровый квартал.

```ruby
  Faker::Russian.cadastral_number(quarter: 120300)    # => 41:16:120300:44567
  Faker::Russian.cadastral_number(quarter: 1203001)   # => 41:16:1203001:44567
  Faker::Russian.cadastral_number(quarter: '0205006') # => 41:16:0205006:44567
```

В приказе ["Об утверждении порядка кадастрового деления территории Российской Федерации, порядка присвоения объектам недвижимости кадастровых номеров, номеров регистрации, реестровых номеров границ"](https://rg.ru/2016/01/27/kadastr-dok.html) сказано:

> В кадастровом округе "Общероссийский" создается один кадастровый район с учетным номером "0:0" и наименованием "Условный", в котором, соответственно, один кадастровый квартал с учетным номером "0:0:0", границы указанных кадастрового района и кадастрового квартала совпадают с границами кадастрового округа "Общероссийский".

Создать такой адрес можно вот так:

```ruby
  Faker::Russian.cadastral_number(district: 0, area: 0, quarter: 0) # 0:0:0:1768
```

Также можно использовать последовательности:

``` ruby
  Faker::Russian.cadastral_number(sequence_number: 1)              # => 38:13:591263:50058
  Faker::Russian.cadastral_number(sequence_number: 1)              # => 38:13:591263:50058
  Faker::Russian.cadastral_number(sequence_number: 1, district: 1) # => 01:38:7762380:5193
  Faker::Russian.cadastral_number(sequence_number: 1, district: 1) # => 01:38:7762380:5193
```

## Инструкции разработчикам

Читай [CONTRIBUTING.md](CONTRIBUTING.md)
