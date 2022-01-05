module Faker
  module Russian
    module Ogrn
      OGRN_SUPPORT_KINDS = %i{legal individual}.freeze

      def ogrn(options = {})
        options.assert_valid_keys(:sequence_number, :region_number, :kind)

        sequence = find_sequence(options[:sequence_number])
        kind = find_kind(options[:kind]&.to_sym, sequence)

        sign_of_reg_num = find_sign_of_reg_num(kind, sequence)
        year_number = year_number(sequence)
        region_number = find_region_number(options[:region_number], sequence, :region_numbers)
        tax_office_code = find_tax_office_code(kind, sequence)
        record_number = find_digits(kind, sequence)
        ogrn_without_check_digit = "#{sign_of_reg_num}#{year_number}#{region_number}#{tax_office_code}#{record_number}"

        ogrn_without_check_digit + check_digit(ogrn_without_check_digit)
      end

    private
      LEGAL_SIGN_OF_REG_NUMS = [1, 5].freeze
      INDIVIDUAL_SIGN_OF_REG_NUM = 4
      private_constant :LEGAL_SIGN_OF_REG_NUMS, :INDIVIDUAL_SIGN_OF_REG_NUM

      def find_kind(kind, sequence)
        return OGRN_SUPPORT_KINDS[sequence.rand(2)] if kind.nil?
        return kind if OGRN_SUPPORT_KINDS.include?(kind)

        raise "there is no any kind other than #{OGRN_SUPPORT_KINDS.map{ |k| ":#{k}" }.join(', ')}"
      end

      def find_sign_of_reg_num(kind, sequence)
        return LEGAL_SIGN_OF_REG_NUMS[sequence.rand(2)] if kind == :legal

        INDIVIDUAL_SIGN_OF_REG_NUM
      end

      def year_number(sequence)
        year = sequence.rand(2000..Date.today.year)
        Date.parse("#{year}-01-01").strftime('%y')
      end

      def find_tax_office_code(kind, sequence)
        sequence.rand(10..99) if kind == :legal
      end

      def find_digits(kind, sequence)
        return sequence.rand(10_000..99_999) if kind == :legal

        sequence.rand(100_000_000..999_999_999)
      end

      def check_digit(digits)
        (digits.to_i % (digits.length - 1) % 10).to_s
      end
    end
  end
end
