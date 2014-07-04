module Faker
  module Russian
    module Sequence
      def find_sequence(number)
        sequence = number || Random.rand(1_000_000_000)
        Random.new(sequence)
      end
    end
  end
end
