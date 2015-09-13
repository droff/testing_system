class QuestionsController < ApplicationController
  include AttributeParams
  before_action :authenticate_user!

  before_filter :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    set_correct_params

    if @question.save
      redirect_to @question, notice: 'success'
    else
      render :new, alert: 'error creating'
    end
  end

  def edit
  end

  def update
    set_correct_attributes
    if @question.update_attributes(question_params.except(:correct_answers))
      redirect_to @question, notice: 'success'
    else
      render :edit, alert: 'error updating'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'deleted'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :score, :qtype,
      { answers: [:a, :b, :c, :d] }, :correct_answers)
  end
end
