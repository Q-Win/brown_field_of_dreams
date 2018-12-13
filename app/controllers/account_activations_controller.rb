class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && user.authenticated?(params[:id])
      user.update_attribute(:activated, true)
      session[:user_id] = user.id
      flash[:success] = "Account Activated!"
      redirect_to dashboard_path
    else
      flash[:danger] = 'Invalid Activation Link'
      redirect_to root_url
    end
  end
end
