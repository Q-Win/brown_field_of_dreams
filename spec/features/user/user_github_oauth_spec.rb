require 'rails_helper'

describe 'Github Oauth' do
  it 'takes the user to github to signin and redirects back to dashboard' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_on("Connect to Github")

    expect(current_path).to eq('https://github.com/auth')
  end
end
