class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(
      title: params[:title],
      description: params[:description],
      public: params[:public]
    )
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end
end
