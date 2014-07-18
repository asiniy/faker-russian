module Faker
  module Russian
    module Okato
      def okato(options = {})
        options.assert_valid_keys(:sequence_number, :okato_region_number, :length)

        sequence = find_sequence(options[:sequence_number])
        okato_region_number = find_okato_region_number(options[:okato_region_number], sequence)
        okato_without_calc = okato_region_number + find_length_digits(options[:length], sequence)
        okato_without_calc + calc_okato(okato_without_calc)
      end

    private

      def find_length_digits(length, sequence)
        if length.present?
          raise 'no such length for okato' unless %w{3 6 9}.include?(length.to_s)
        else
          length = [3, 6, 9][sequence.rand(3)]
        end

        sprintf("%06d", sequence.rand(1_000_000)).split(//).first(length.to_i - 3).join
      end

      def calc_okato(okato_without_calc)
        ((calc_okato_digit(okato_without_calc, 1) < 10) ? calc_okato_digit(okato_without_calc, 1) : calc_okato_digit(okato_without_calc, 3) % 10).to_s
      end

      def calc_okato_digit(okato_without_calc, adding_number)
        okato_without_calc.split(//).map(&:to_i).each_with_index.inject(0){ |s, p| s + p[0] * (p[1] + adding_number) } % 11
      end

    end
  end
end
