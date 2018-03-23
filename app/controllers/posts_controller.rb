class PostsController < ApplicationController

  before_action :set_user
  before_action :set_user_post, only: [:show, :update, :destroy]

  # GET /users/<user_id>/posts
  def index
    posts = @user.posts
    render json: posts
  end

  # GET /users/<user_id>/posts/<id>
  def show
    post = @user.posts.find(params[:id])
    render json: {"id": post.id, "title": post.title, "body": post.body, "created": post.date}
  end

  # POST /users/<user_id>/posts
  def create
    post = @user.posts.create!(post_params)
    render json: {"id": post.id}
  end

  # PUT /users/<user_id>/posts/<id>
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE /users/<user_id>/posts/<id>
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :body, :date)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_post
    @post = @user.items.find_by!(id: params[:id]) if @post
  end

end
