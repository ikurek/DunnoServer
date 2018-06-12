class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.user = current_user

    if question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def toggle_vote
    question = Question.find(params[:id])
    upvote = QuestionUpvote.find_by(user: current_user, question: question)

    if upvote
      upvote.destroy
    else
      QuestionUpvote.create(user: current_user, question: question)
    end

    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :author)
  end
end
