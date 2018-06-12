class Api::QuestionsController < Api::ApiController
  def index
    render json: Question.all
  end

  def show
    question = Question.find(params[:id])
    json = question.as_json

    render json: json
  end

  def create
    question = Question.new(question_params)
    question.user = current_user

    if question.save!
      head :ok
    else
      head :bad_request
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
