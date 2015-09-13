require 'spec_helper'

describe HstoreValidator, class: HstoreValidator do
  subject { Question.new(title: '1 + 1', score: 1, qtype: 'radioButton') }

  it 'be invalid with nil' do
    subject.answers = nil
    expect(subject.valid?).to be_falsy
  end

  it 'be invalid with empty' do
    subject.answers = ''
    expect(subject.valid?).to be_falsy
  end

  it 'be invalid with empty hash value' do
    subject.answers = { 'a' => '1', 'b' => '' }
    expect(subject.valid?).to be_falsy
  end

  it 'be valid' do
    subject.answers = { 'a' => '1', 'b' => '2' }
    subject.correct_answers = ['b']
    expect(subject.valid?).to be_truthy
  end

  describe 'validates condition' do
    it 'be valid if qtype is textInput' do
      subject.qtype = 'textInput'
      subject.answers = nil
      subject.correct_answers = ['2']
      expect(subject.valid?).to be_truthy
    end
  end
end
