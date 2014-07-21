module Faker
  module Russian
    module Bik
      def bik(options = {})
        options.assert_valid_keys(:sequence_number, :okato_region_number)

        sequence = find_sequence(options[:sequence_number])
        okato_region_number = find_okato_region_number(options[:okato_region_number], sequence)

        '04' + okato_region_number + sprintf("%06d", sequence.rand(1_000_000))
      end

    end
  end
end
