module NumGenerator
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_number(obj)
      Zlib::crc32(obj)
      #SecureRandom.random_number(10**10)
    end
  end
end
