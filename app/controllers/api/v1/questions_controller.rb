class Api::V1::QuestionsController < ApplicationController
  include JsonParams

  def index
    @questions = Question.all

    render json: @questions
  end

  def create
    if incorrect_params?
      render json: true, status: 400
    else
      @questions = Question.get_answers(params[:json])
      render json: @questions, each_serializer: AnswerSerializer
    end
  end
end
