class GithubInviteFacade

  def initialize(user_name)
    @user_name = user_name
  end

  def email
    info = service.user_info

    info[:email]
  end

  private

  def service
    GithubInviteService.new(@user_name)
  end

end
