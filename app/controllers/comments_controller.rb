class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.account_id = current_account.id

    if @comment.save
       redirect_to url_for([@post.community, @post])
    else
      # Handle validation errors if needed
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
