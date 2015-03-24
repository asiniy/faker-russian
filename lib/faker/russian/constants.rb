module Faker
  module Russian
    module Constants
      REGION_NUMBERS = %w{01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 83 86 87 89 91 92}

      OKATO_REGION_NUMBERS = %w{01 03 04 05 07 08 11 12 14 15 17 19 20 22 24 25 26 27 28 29 32 33 34 35 36 37 38 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99}

      OKV = %w{008 012 032 036 044 048 050 051 052 060 064 068 072 084 090 096 104 108 116 124 132 136 144 152 156 170 174 188 191 192 203 208 214 222 230 232 238 242 262 270 292 320 324 328 332 340 344 348 352 356 360 364 368 376 388 392 398 400 404 408 410 414 417 418 422 426 428 430 434 440 446 454 458 462 478 480 484 496 498 504 512 516 524 532 533 548 554 558 566 578 586 590 598 600 604 608 634 643 646 654 678 682 690 694 702 704 706 710 728 748 752 756 760 764 776 780 784 788 800 807 810 818 826 834 840 858 860 882 886 901 931 932 934 936 937 938 940 941 943 944 946 949 950 951 952 953 960 967 968 969 970 971 972 973 974 975 976 977 978 980 981 985 986}.freeze

      def find_region_number(number = nil, sequence, region_number_type)
        region_numbers = Faker::Russian::Constants.const_get(region_number_type.to_s.upcase)

        if number.present?
          raise('there is no region with that number!') unless region_numbers.include?(number.to_s)
          number.to_s
        else
          region_numbers[sequence.rand(region_numbers.size)]
        end
      end

      def find_okv(okv = nil, sequence)
        if okv && okv.to_s.length > 0
          raise ArgumentError.new("There is no OKV \"%s\"" % okv.to_s) unless OKV.include?(okv.to_s)
          okv.to_s
        else
          OKV[sequence.rand(OKV.size)]
        end
      end
    end
  end
end
