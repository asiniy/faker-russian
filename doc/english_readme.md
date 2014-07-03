# Faker::Russian

[[по-русски](../README.md)]
[![Gem Version](https://badge.fury.io/rb/faker-russian.svg)](http://badge.fury.io/rb/faker-russian)
[![Build Status](https://travis-ci.org/asiniy/faker-russian.svg?branch=master)](https://travis-ci.org/asiniy/faker-russian)
[![Code Climate](https://codeclimate.com/github/asiniy/faker-russian.png)](https://codeclimate.com/github/asiniy/faker-russian)

Generation of specific russian values

* [INN](http://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика) (Faker::Russian.inn) Russian analogue of VAT identification number
* (TODO) [OKPO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_предприятий_и_организаций) (Faker::Russian.okpo) Legal code
* [KPP](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт) (Faker::Russian.kpp) Code of reason for registration
* (TODO) [OGRN](http://ru.wikipedia.org/wiki/Основной_государственный_регистрационный_номер) (Faker::Russian.ogrn) Main state registration number
* (TODO) [Correspondent Account Value] (http://ru.wikipedia.org/wiki/Корреспондентский_счёт) (Faker::Russian.ks)
* (TODO) [Bank account value] (http://ru.wikipedia.org/wiki/Расчётный_счёт) (Faker::Russian.rs)
* (TODO) [OKATO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_объектов_административно-территориального_деления) (Faker::Russian.okato)
* (TODO) [SNILS](http://ru.wikipedia.org/wiki/Страховой_номер_индивидуального_лицевого_счёта) (Faker::Russian.snils)
* (TODO) [Passport value](http://ru.wikipedia.org/wiki/Паспорт_гражданина_Российской_Федерации) (Faker::Russian.passport)

You can use [gem 'validates_russian'](https://github.com/asiniy/validates_russian) for validates generated values

## Installation

Add to Gemfile

    gem 'validates_russian'

## Usage

### INN

Generate INN with random region number and type (:individual or :legal)

``` ruby
  Faker::Russian.inn # => '183501166447'
```

You can set `region_number` and type

``` ruby
  Faker::Russian.inn(region_number: '78') # => '7857296996'
  Faker::Russian.inn(kind: :individual) # => '0229191612'
  Faker::Russian.inn(kind: :legal) # => '366582211439'
```

Also you can use sequences

``` ruby
  Faker::Russian.inn(sequence_number: 1) # => '0956860593'
  Faker::Russian.inn(sequence_number: 1) # => '0956860593'
```

### KPP

Generate KPP with random region_number

``` ruby
  Faker::Russian.kpp # => '525601001'
```

You can choose region

``` ruby
  Faker::Russian.kpp(region_number: 78) # => '784101001'
```

Also, you can use pseudo random sequence numbers (not much 1000, there is limited count of kpps)

``` ruby
  Faker::Russian.kpp(sequence_number: 1) # => '381201001'
  Faker::Russian.inn(sequence_number: 1) # => '381201001'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/faker-russian/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
