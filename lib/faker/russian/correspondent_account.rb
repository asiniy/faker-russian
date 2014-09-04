module Faker
  module Russian
    module CorrespondentAccount
      def correspondent_account(options = {})
        options.assert_valid_keys(:sequence_number, :bik)

        sequence = find_sequence(options[:sequence_number])
        member_number = find_member_number(options[:bik], sequence)

        '301' + sprintf("%014d", sequence.rand(1_000_000_000)) + member_number
      end
      alias_method :ks, :correspondent_account
      alias_method :ca, :correspondent_account

    private

      def find_member_number(bik, sequence)
        if bik && bik.length > 3
          bik[-3..-1]
        else
          "%03d" % sequence.rand(1_000)
        end
      end
    end
  end
end
