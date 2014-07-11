module Faker
  module Russian
    module Inn
      def inn(options = {})
        options.assert_valid_keys(:sequence_number, :region_number, :kind)

        sequence = find_sequence(options[:sequence_number])
        region_number = find_region_number(options[:region_number], sequence)
        kind = find_kind(options[:kind], sequence)
        sequence_digits = find_digits(kind, sequence)

        inn_without_check_digit = region_number + sequence_digits
        inn_without_check_digit + check_digit(inn_without_check_digit)
      end

    private

      def find_kind(kind, sequence)
        case kind
        when :individual, :legal then kind
        when nil then [:individual, :legal][sequence.rand(2)]
        else raise 'there is no any kind other than :individual or :legal'
        end
      end

      def find_digits(kind, sequence)
        (kind == :legal) ? sequence.rand(1_000_000..9_999_999).to_s : sequence.rand(10_000_000..99_999_999).to_s
      end

      def check_digit(digits)
        if digits.length == 9
          calc(P10, digits)
        else
          calc(P11, digits) + calc(P12, digits + calc(P11, digits))
        end
      end

      def calc(p, inn)
        (p.each_with_index.inject(0){ |s, p| s + p[0] * inn[p[1]].to_i } % 11 % 10).to_s
      end

      P10 = [2, 4, 10, 3, 5, 9, 4, 6, 8]
      P11 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
      P12 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
      private_constant :P10, :P11, :P12
    end
  end
end
