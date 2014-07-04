module Faker
  module Russian
    module Constants
      REGION_NUMBERS = %w{01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 83 86 87 89}

      def find_region_number(number = nil, sequence)
        region_numbers = Faker::Russian::Constants::REGION_NUMBERS

        if number.present?
          raise('there is no region with that number!') unless region_numbers.include?(number.to_s)
          number.to_s
        else
          region_numbers[sequence.rand(region_numbers.size)]
        end
      end
    end
  end
end
