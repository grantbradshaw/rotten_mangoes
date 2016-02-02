class Admin::UsersController < ApplicationController

  def index
    @users = Kaminari.paginate_array(User.order(:firstname)).page(params[:page]).per(5)
    redirect_to movies_path, notice: "You are not an admin!" unless current_user.admin
  end
end
