class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.new comment_params

    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:error] = "Error in commenting."
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]

  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy

    redirect_to request.referrer 
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find params[:post_id]
  end

end
