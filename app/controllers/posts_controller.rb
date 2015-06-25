class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to posts_path, flash: { success: "Yey" }
    else
      flash[:error] = "Add Title Please"
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update post_params
      redirect_to posts_path, flash: { success: "Yey" }
    else
      flash[:error] = "Add Title Please"
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]

    if @post.destroy
      redirect_to posts_path, flash: { success: "Yey destroyed" }
    else
      render :edit
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = @post.comments.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
