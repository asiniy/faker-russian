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

      def find_sequence(number)
        sequence = number || Random.rand(1_000_000_000)
        Random.new(sequence)
      end

      def find_region_number(number = nil, sequence)
        region_numbers = Faker::Russian::SharedConstants::REGION_NUMBERS

        if number.present?
          raise('there is no region with that number!') unless region_numbers.include?(number.to_s)
          number.to_s
        else
          region_numbers[sequence.rand(region_numbers.size)]
        end
      end

      def two_region_numbers(sequence)
        sprintf '%02d', sequence.rand(100)
      end

    end
  end
end
