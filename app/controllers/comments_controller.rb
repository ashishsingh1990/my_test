class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create 
      user_role = Todo.find_by(id: params[:todo_id]).user.role if  params[:todo_id].present?
      if user_role == current_user.role || current_user.expert?
        @comment = @commentable.comments.new comment_params
        @comment.user = current_user
        if @comment.save
          redirect_to @commentable, notice: "Your comment was successfully posted."
        else
          redirect_to @commentable, alert: "Title can't nil"
        end  
   else
      redirect_to @commentable, alert: "You can not comment on this Todo."
   end
  end

  private

    def comment_params
      params.require(:comment).permit(:title)
    end
end
