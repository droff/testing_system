class Question < ActiveRecord::Base
  include NumGenerator
  include Answers

  QTYPES = ['radioButton', 'textInput', 'checkboxInput']

  validates :title, :score, :qtype, :correct_answers, presence: true
  validates :answers, hstore: true, if: :not_text_input?

  before_save :generate_checksum

  def simple_answers
    OpenStruct.new HashWithIndifferentAccess.new(self.answers) if self.answers
  end

  private

  def generate_checksum
    self.checksum = Question.generate_number(self.title)
  end

  def not_text_input?
    self.qtype != 'textInput'
  end
end
