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
     respond_to do |format|
      if @user.update(status: params[:status])
        format.html { redirect_to "/users", notice: "User's Status updated successsfullly." }
      else
        format.html { redirect_to "/users", danger: "Status not updated" }
      end
    end 
  end

end
