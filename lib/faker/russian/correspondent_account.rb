module Faker
  module Russian
    module CorrespondentAccount
      def correspondent_account(options = {})
        options.assert_valid_keys(:sequence_number)

        sequence = find_sequence(options[:sequence_number])

        '301' + sprintf("%017d", sequence.rand(1_000_000_000))
      end
      alias_method :ks, :correspondent_account
      alias_method :ca, :correspondent_account

    private

    end
  end
end
