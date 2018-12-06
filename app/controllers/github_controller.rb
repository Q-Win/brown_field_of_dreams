class GithubController < ApplicationController

  def create
   git = GithubData.new
   git.token = auth_hash["credentials"]["token"]
   git.user_name = auth_hash["extra"]["raw_info"]["login"]
   git.user_id = current_user.id
   git.save
   redirect_to '/dashboard'
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
