class CommentsController < ApplicationController
  def create
    # first load the post
    @post = Post.where(id: params[:post_id]).first
    # create comment
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      # end of the world
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
