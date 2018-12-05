require 'rails_helper'

describe 'User' do
  it 'user can ' do
    VCR.use_cassette("user_sees_repos_spec") do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"
      save_and_open_page
      expect(page).to have_content('Github')

    end

  end

end
