module Faker
  module Russian
    module Okpo
      def okpo(options = {})
        options.assert_valid_keys(:sequence_number)

        sequence = find_sequence(options[:sequence_number])
        okpo_digits = okpo_region_numbers(sequence)
        okpo_digits + okpo_calc(okpo_digits)
      end

    private

      def okpo_region_numbers(sequence)
        if [true, false][sequence.rand(2)]
          sprintf '%07d', sequence.rand(10_000_000)
        else
          sprintf '%09d', sequence.rand(1_000_000_000)
        end
      end

      def okpo_calc(okpo_digits)
        (okpo_digits.split(//).map(&:to_i).each_with_index.inject(0) { |s, (p, i)| s + p * (i + 1) } % 11 % 10).to_s
      end

    end
  end
end
