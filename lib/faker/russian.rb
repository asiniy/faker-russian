require 'active_support/core_ext/hash/keys.rb'
require 'active_support/core_ext/object/blank.rb'

Dir[File.dirname(__FILE__) + '/russian/**/*.rb'].each{ |f| require f }

module Faker
  module Russian
    extend Constants
    extend Sequence
    extend Version

    extend Bik
    extend Inn
    extend Kpp
    extend Okato
    extend Okpo
    extend Snils
    extend CorrespondentAccount
    extend Rs
  end
end
