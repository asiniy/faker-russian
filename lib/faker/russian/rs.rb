module Faker
  module Russian
    module Rs
      def rs(options = {})
        options.assert_valid_keys(:sequence_number, :okv)

        sequence = find_sequence(options[:sequence_number])
        okv_digits = find_okv(options[:okv], sequence)

        ('%05d' % sequence.rand(100_000)) + okv_digits + ('%012d' % sequence.rand(1_000_000_000))
      end
    end
  end
end
