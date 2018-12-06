require 'rails_helper'

describe 'User' do
  it 'user can ' do
    VCR.use_cassette("user_sees_repos_and_followers_spec") do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      expect(page).to have_content('Github')
      expect(page).to have_link('dsi-python-fundamentals')
      expect(page).to have_content('Followers')
      expect(page).to have_link('averimj')
      expect(page).to have_content('Following')
      expect(page).to have_link('prestonjarnagin')
    end

  end

end
