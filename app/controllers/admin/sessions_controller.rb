class Admin::SessionsController < ApplicationController
  def alias
    session[:hidden_admin] = current_user.id
    session[:user_id] = params[:id]
    redirect_to movies_path
  end

  def uncloak
    session[:user_id] = session[:hidden_admin]
    session[:hidden_admin] = nil
    redirect_to admin_users_path
  end
end
