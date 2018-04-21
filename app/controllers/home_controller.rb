class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:user_index, :user_edit, :user_update]
  before_action :custom_auth, only: [:user_index, :user_edit, :user_update]
  def index
  end

  def user_index
  	@users = User.all
  end

  def user_edit
  	@user =User.find_by(id: params[:id])
  end

  def user_update
  	@user = User.find_by(id: params[:id])
      if @user.update(status: params[:status])
         redirect_to "/users", notice: "User status updated successsfullly." 
      else
        redirect_to "/users", alert: "Status not updated" 
      end
  end

end
