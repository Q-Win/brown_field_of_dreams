class InviteController < ApplicationController

  def new

  end

  def create
    email = GithubInviteFacade.new(params[:q]).email
    email = "quinn.krug@yahoo.com"
    if !email.nil?
      UserMailer.invite_email(current_user.first_name, email, params[:q])
      flash[:success] = "Successfully sent invite!"
      redirect_to dashboard_path
    else
      flash[:notice] = "The Github user you selected doesn't have an email address associated with their account."
      redirect_to dashboard_path
    end
  end
end
