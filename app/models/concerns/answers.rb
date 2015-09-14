module Answers
  extend ActiveSupport::Concern

  included do
    class_attribute :user_answer
    class_attribute :correct
  end

  def check_answer(user_answer)
    self.correct = answer_correct?(user_answer)
    self.user_answer = user_answer
    self
  end

  private

  def answer_correct?(user_answer)
    case self.qtype
    when 'radioButton'
      self.correct_answers == user_answer.keys
    when 'textInput'
      self.correct_answers == user_answer
    when 'checkboxInput'
      self.correct_answers == user_answer.map(&:keys).flatten
    else
      false
    end
  end

  module ClassMethods
    def get_answers(params)
      params = params.reduce(Hash.new, :merge)
      checksum_ids = params.keys

      Question.where(checksum: checksum_ids).map do |question|
        question.check_answer(params[question.checksum]['value'])
      end
    end
  end
end
