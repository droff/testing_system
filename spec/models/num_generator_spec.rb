require 'spec_helper'

class Klass
  include NumGenerator
end

describe Klass do
  describe 'generate_checksum' do
    subject { Klass.generate_number }

    it 'will integer' do
      expect(subject).to be_a Fixnum
    end

    it 'has 10 digits size' do
      expect(subject.to_s.size).to eq 10
    end

    it 'be uniq' do
      count = 10
      nums = count.times.map { Question.generate_number }
      expect(nums.uniq.size).to eq count
    end

    it 'create' do
      question = create(:question_radio)
      expect(question.checksum).to be_a Fixnum
    end
  end
end
