class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      flash[:success] = "Comment successfully added."
    else
      flash[:error] = "Failed adding comment."
    end
    redirect_to "/events/#{comment_params[:event_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :event_id, :user_id)
  end
end
