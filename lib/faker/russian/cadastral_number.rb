module Faker
  module Russian
    module CadastralNumber
      def cadastral_number(options = {})
        options.assert_valid_keys(:sequence_number, :district, :area, :quarter)

        sequence = find_sequence(options[:sequence_number])

        district = format_number(options[:district] || cadastral_district(sequence))
        area = format_number(options[:area] || cadastral_area(sequence))
        quarter = options[:quarter] || cadastral_quarter(sequence)

        "#{district}:#{area}:#{quarter}:#{property_number(sequence)}"
      end

      private

        def cadastral_district(sequence)
           sequence.rand(1..91)
        end

        def cadastral_area(sequence)
          sequence.rand(1..99)
        end

        def cadastral_quarter(sequence)
          sequence.rand(2) == 0 ? sequence.rand(100000..999999) : sequence.rand(1000000..9999999)
        end

        def property_number(sequence)
          sequence.rand(1..99999)
        end

        def format_number(number)
          number = number.to_s
          return "0#{number}" if number.length == 1 && number != '0'

          number
        end
    end
  end
end
