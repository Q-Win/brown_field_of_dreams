class UsersController < ApplicationController

  def show

    if current_user.github_data
      @facade = GithubFacade.new(current_user.github_data.token)
      @repos = @facade.repos[0..4]
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
      activation_token = user.activation_token
      user.update_attribute(:activation_digest , digest(activation_token))
      UserMailer.email_confirmation(user, activation_token).deliver
      flash[:success] =  "This account has not yet been activated. Please check your email."
      redirect_to root_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

  def digest(token)
    BCrypt::Password.create(token)
  end

end
