class Admin::UsersController < ApplicationController

  before_filter :restrict_access, :restrict_non_admin
  def index
    @users = Kaminari.paginate_array(User.order(:firstname)).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "You created #{@user.firstname}"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
