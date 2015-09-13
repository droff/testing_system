module AttributeParams
  def set_correct_params
    @question.correct_answers = correct_answers_params
  end

  def set_correct_attributes
    @question.attributes = { correct_answers: correct_answers_params }
  end

  private

  #def params_nil?
  #  params[:question][:answers].nil? ||
  #  params[:question][:correct_answers].nil? ||
  #  params[:question][:answers].values.include?('')
  #end

  #def answers_param
  #  params[:question][:answers].map { |k, v| { option: k, value: v } }
  #end

  def correct_answers_params
    [params[:question][:correct_answers]].flatten.delete_if(&:empty?)
  end
end
