# Инструкции разработчикам

Модуль `Faker::Russian` делает extend других модулей, в которых и находится функционал библиотеки.

Например:

``` ruby
module Faker
  module Russian
    extend SharedConstants
    extend Version

    extend Inn # функционал ИНН
    # other modules
  end
end
```

``` ruby
module Faker
  module Russian
    module Inn
      def inn(options = {})
        # code
```

Константы (номера регионов, классификация госучреждений и т.д.) и методы работы с ними размещать в `Faker::Russian::Constants`

Для каждого модуля предусмотреть последовательности(`Faker::Russian::Sequence`), а также возможность подстановки значений констант (напр., см. опцию `region_number` в `#inn`)

Также надо предусмотреть вывод ошибки, если в Faker подставляется несуществующий параметр
