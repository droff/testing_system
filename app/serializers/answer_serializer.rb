class AnswerSerializer < QuestionSerializer
  def attributes
    h = super
    if object.correct?
      h[:user_answer_correct] = merge_with_value
    else
      h[:user_answer] = merge_with_value
    end

    h[:correct_answers] = object.correct_answers.map(&:capitalize)

    h.delete_if { |_, v| v.nil? }
  end

  private

  def merge_with_value
    h = make_option_value_hash(object.user_answer)

    if object.qtype == 'radioButton'
      h.merge({ correct: object.correct })
    else
      { value: h, correct: object.correct }
    end
  end

  def make_option_value_hash(h)
    case object.qtype
    when 'radioButton'
      [h].flatten[0].map { |k, v| { option: k.capitalize, value: v } }[0]
    when 'textInput'
      h
    else
      h.map { |e| e.map { |k, v| { option: k.capitalize, value: v } } }.flatten
    end
  end
end
