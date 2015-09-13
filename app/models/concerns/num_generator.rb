module NumGenerator
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_number
      SecureRandom.random_number(10**10)
    end
  end
end
