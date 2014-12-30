module Faker
  module Russian
    module Snils
      def snils(options = {})
        options.assert_valid_keys(:sequence_number)

        sequence = find_sequence(options[:sequence_number])
        snils_digits = '%09d' % sequence.rand(1_000_000_000)

        snils_digits + check_digits(snils_digits)
      end

    private

      def check_digits(snils_digits)
        digits = snils_digits.split('').map(&:to_i)
        checksum = digits.each_with_index.inject(0) do |sum, (digit, index)|
          sum + digit * (9 - index)
        end % 101 % 100
        '%02d' % checksum
      end
    end
  end
end
