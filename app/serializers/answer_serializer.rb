class AnswerSerializer < QuestionSerializer
  def attributes
    h = super
    if object.correct?
      h[:user_answer_correct] = merge_with_value
    else
      h[:user_answer] = merge_with_value
    end

    h.delete_if { |_, v| v.nil? }
  end

  def merge_with_value
    if object.qtype == 'radioButton'
      object.user_answer.merge({ correct: object.correct })
    else
      { value: object.user_answer, correct: object.correct }
    end
  end
end
