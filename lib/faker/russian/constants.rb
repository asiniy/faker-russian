module Faker
  module Russian
    module Constants
      REGION_NUMBERS = %w{01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 83 86 87 89}

      OKATO_REGION_NUMBERS = %w{01 03 04 05 07 08 11 12 14 15 17 19 20 22 24 25 26 27 28 29 32 33 34 36 37 38 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99}

      OKV = %w{388 728 156 230 132 144 756 752 152 203 191 238 826 654 646 953 952 950 174 262 348 608 940 858 860 478 800 949 788 496 398 834 882 050 968 938 972 706 417 760 702 941 690 408 960 682 222 710 462 360 643 116 072 446 586 776 512 578 934 901 604 946 376 554 532 524 064 232 566 498 943 484 504 458 969 480 426 440 748 434 422 430 694 340 008 428 981 104 414 192 188 976 931 977 170 418 598 320 404 454 973 634 124 886 352 364 368 400 356 392 558 985 967 970 818 978 704 214 242 780 840 090 136 516 932 678 784 807 208 270 332 600 980 344 292 324 936 328 951 410 548 108 096 986 068 937 975 060 974 084 048 764 052 590 044 971 533 051 032 012 944 036 810}.freeze

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
