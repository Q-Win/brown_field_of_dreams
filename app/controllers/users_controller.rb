class UsersController < ApplicationController
  def show

    if current_user.github_data
      @facade = GithubFacade.new(current_user.github_data.token)
    end

    if current_user
      @user_videos = current_user.sort_videos
    end

  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
