require 'spec_helper'

class Klass
  include NumGenerator

  def self.random_string
    (0...rand(1..128)).map { ('a'..'z').to_a[rand(26)] }.join
  end
end

describe Klass do
  describe 'generate_checksum' do
    subject { Klass.generate_number(Klass.random_string) }

    it 'will integer' do
      expect(subject).to be_a Fixnum
    end

    it 'be uniq' do
      count = 100
      nums = count.times.map { Klass.generate_number(Klass.random_string) }
      expect(nums.uniq.size).to eq count
    end

    it 'create' do
      question = create(:question_radio)
      expect(question.checksum).to be_a Fixnum
    end
  end
end
