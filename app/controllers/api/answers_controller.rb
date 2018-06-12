class Api::AnswersController < Api::ApiController
  def index
    @question = Question.find(params[:question_id])
    render json: @question.answers
  end

  def create
    answer = Answer.new(answer_params)
    answer.user = current_user

    if answer.save!
      head :ok
    else
      head :bad_request
    end
  end

  private

  def answer_params
    temp = params.require(:answer).permit(:body, :author, :question_id)
    temp[:question_id] ||= params[:question_id]

    temp
  end
end
