# Faker::Russian

[[english_doc](doc/english_readme.md)]
[![Gem Version](https://badge.fury.io/rb/faker-russian.svg)](http://badge.fury.io/rb/faker-russian)
[![Build Status](https://travis-ci.org/asiniy/faker-russian.svg?branch=master)](https://travis-ci.org/asiniy/faker-russian)
[![Code Climate](https://codeclimate.com/github/asiniy/faker-russian.png)](https://codeclimate.com/github/asiniy/faker-russian)

Генерация русских значений: ИНН, ОКПО, КПП и т.д.

* [ИНН](http://ru.wikipedia.org/wiki/Идентификационный_номер_налогоплательщика) (Faker::Russian.inn)
* [ОКПО](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_предприятий_и_организаций) (Faker::Russian.okpo)
* [КПП](http://ru.wikipedia.org/wiki/Код_причины_постановки_на_учёт) (Faker::Russian.kpp)
* (TODO) [ОГРН](http://ru.wikipedia.org/wiki/Основной_государственный_регистрационный_номер) (Faker::Russian.ogrn)
* (TODO) [Корреспондентский счёт] (http://ru.wikipedia.org/wiki/Корреспондентский_счёт) (Faker::Russian.ks)
* (TODO) [Рассчётный счёт] (http://ru.wikipedia.org/wiki/Расчётный_счёт) (Faker::Russian.rs)
* (TODO) [OKATO](http://ru.wikipedia.org/wiki/Общероссийский_классификатор_объектов_административно-территориального_деления) (Faker::Russian.okato)
* (TODO) [СНИЛС](http://ru.wikipedia.org/wiki/Страховой_номер_индивидуального_лицевого_счёта) (Faker::Russian.snils)
* (TODO) [Значение паспорта](http://ru.wikipedia.org/wiki/Паспорт_гражданина_Российской_Федерации) (Faker::Russian.passport)

Для проверки сгенерированных значений можешь использовать [gem 'validates_russian'](https://github.com/asiniy/validates_russian)

## Установка

Добавь в Gemfile

    gem 'faker-russian'

## Использование

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
  Faker::Russian.inn(sequence_number: 1) # => '381201001'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/faker-russian/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
