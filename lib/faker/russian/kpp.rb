module Faker
  module Russian
    module Kpp
      def kpp(options = {})
        if (options.keys - [:sequence_number, :region_number]).any?
          raise 'wrong options. just :region_number or :sequence_number'
        end

        sequence = find_sequence(options[:sequence_number])
        region_number = find_region_number(options[:region_number], sequence)

        region_number + two_region_numbers(sequence) + '01001'
      end

    private

      def two_region_numbers(sequence)
        sprintf '%02d', sequence.rand(100)
      end

    end
  end
end
