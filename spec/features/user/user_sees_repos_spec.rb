require 'rails_helper'

describe 'User' do
  it 'user can ' do
    VCR.use_cassette("user_sees_repos_and_followers_spec") do
      user = create(:user)
      GithubData.create(user_id: user.id, github_id: 2, token: 3, user_name: 'jaw')
      user_2 = create(:user)
      GithubData.create(user_id: user_2.id, github_id: 33760591, token: 3, user_name: 'jaw')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      expect(page).to have_content('Github')
      expect(page).to have_content('averimj')
      expect(page).to have_content('prestonjarnagin')
    end

  end

end
