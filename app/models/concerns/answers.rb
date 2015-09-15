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
    self.correct_answers == user_answer.map(&:downcase)
  end

  module ClassMethods
    def get_answers(params)
      params = params.reduce(Hash.new, :merge)
      checksum_ids = params.keys

      Question.where(checksum: checksum_ids).map do |question|
        question.check_answer(params[question.checksum.to_s]['value'])
      end
    end
  end
end
