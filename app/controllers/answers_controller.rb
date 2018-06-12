class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    answer = Answer.new(answer_params)
    answer.user = current_user

    if answer.save!
      redirect_to question_path(answer.question)
    else
      render :new
    end
  end

  def toggle_vote
    answer = Answer.find(params[:id])
    upvote = AnswerUpvote.find_by(user: current_user, answer: answer)

    if upvote
      upvote.destroy
    else
      AnswerUpvote.create(user: current_user, answer: answer)
    end

    redirect_to question_path(answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :author, :question_id)
  end
end
