class QuestionSerializer < ActiveModel::Serializer
  attributes :question, :score, :answers, :type, :checksum

  def question
    object.title
  end

  def type
    object.qtype
  end

  def answers
    make_answers_hash unless object.answers.nil?
  end

  private

  def make_answers_hash
    object.answers.map do |k, v|
      {
        option: k.capitalize,
        value: v,
        correct: object.correct_answers.include?(k)
      }
    end
  end
end
