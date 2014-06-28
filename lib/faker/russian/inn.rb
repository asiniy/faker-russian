module Faker
  module Russian
    module Inn
      def inn(options = {})
        region_number = find_region_number(options[:region_number])
        kind = find_kind(options[:kind])
        sequence_digits = find_sequence_digits(kind, options[:sequence_number])

        inn_without_check_digit = region_number + sequence_digits
        inn_without_check_digit + check_digit(inn_without_check_digit)
      end

    private

      def find_region_number(number = nil)
        if number.present?
          raise('there is no region with that number!') unless Faker::Russian::SharedConstants::REGION_NUMBERS.include?(number.to_s)
          number.to_s
        else
          Faker::Russian::SharedConstants::REGION_NUMBERS.sample
        end
      end

      def find_kind(kind)
        case kind
        when :individual then :individual
        when :legal then :legal
        when nil then [:individual, :legal].sample
        else raise 'there is no any kind other than :individual or :legal'
        end
      end

      def find_sequence_digits(kind, sequence_number)
        sequence = sequence_number || Random.rand(1_000_000_000)
        seed = Random.new(sequence)

        (kind == :legal) ? seed.rand(1_000_000..9_999_999).to_s : seed.rand(10_000_000..99_999_999).to_s
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
