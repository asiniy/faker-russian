Dir[File.dirname(__FILE__) + '/russian/**/*.rb'].each{ |f| require f }

module Faker
  module Russian
    extend Constants
    extend Sequence
    extend Version

    extend Inn
    extend Kpp
    extend Okpo
  end
end
