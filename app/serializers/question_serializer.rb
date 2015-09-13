class QuestionSerializer < ActiveModel::Serializer
  attributes :question, :score, :answers, :type, :checksum

  def question
    object.title
  end

  def type
    object.qtype
  end

  def answers
    object.answers.map { |k, v| { option: k.capitalize, value: v } }
  end
end