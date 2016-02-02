class Admin::UsersController < ApplicationController

  def index
    @users = User.all

    redirect_to movies_path, notice: "You are not an admin!" unless current_user.admin
  end
end
