require 'rails_helper'

describe 'user visits dashboard' do
  it 'allows them to add and delete friends' do
    VCR.use_cassette("user_sees_repos_and_followers_spec", :allow_playback_repeats => true) do

      user = create(:user)
      GithubData.create(user_id: user.id, github_id: 2, token: 3, user_name: 'jaw')
      user_2 = create(:user)
      GithubData.create(user_id: user_2.id, github_id: 33760591, token: 3, user_name: 'jaw')
      Friendship.create(user_id: user.id, friend_id: user_2.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      find(".remove-friend").first(:button, "Remove Friend").click
      
      expect(page).to have_button "Add Friend"
      expect(page).to_not have_button "Remove Friend"
    end
  end
end
