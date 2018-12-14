require 'rails_helper'

describe 'User enters github handle and clicks button to send invite' do
  it 'sends an email inviting their friend' do
    VCR.use_cassette("user_email") do
      user = create(:user, activated: true)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      click_on "Send an Invite"

      expect(current_path).to eq('/invite')

      fill_in "Github Handle", with: 'qkTest'
      click_on "Send Invite"

      expect(current_path).to eq('/dashboard')
    end
  end
end
