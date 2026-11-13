class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end