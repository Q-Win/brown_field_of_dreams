require 'rails_helper'

RSpec.describe GithubUser, type: :model do

  describe 'model' do
    it 'exists' do
      user_data = {:login => "cat", :html_url => "cat.com"}
      test_user = GithubUser.new(user_data)

      expect(test_user.handle).to eq('cat')
      expect(test_user.url).to eq('cat.com')
    end
  end

end
