Dir[File.dirname(__FILE__) + '/russian/**/*.rb'].each{ |f| require f }

module Faker
  module Russian
    extend SharedConstants
    extend Version

    extend Inn
  end
end
