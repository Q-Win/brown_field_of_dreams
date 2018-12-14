class FriendshipsController < ApplicationController

  def create
    if User.find(params[:friend_id])
      friendship = current_user.friendships.build(friend_id: params[:friend_id])
      friendship.save
      redirect_back(fallback_location: dashboard_path)
    else
      flash[:notice] = "User is not in our system"
      redirect_back(fallback_location: dashboard_path)
    end
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:friend_id])
    friendship.destroy
    redirect_back(fallback_location: dashboard_path)
  end

end
