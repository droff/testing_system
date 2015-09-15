module AttributeParams
  def set_correct_params
    @question.correct_answers = correct_answers_params
  end

  def set_correct_attributes
    @question.attributes = { correct_answers: correct_answers_params }
  end

  private

  def correct_answers_params
    [params[:question][:correct_answers]].flatten.delete_if(&:empty?)
  end
end
