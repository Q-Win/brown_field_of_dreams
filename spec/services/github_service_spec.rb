require 'rails_helper'

describe GithubService do

  it "can get a JSON" do
    VCR.use_cassette("github_user_data") do
      github_service = GithubService.new(ENV["GITHUB_SERVICE_TEST_TOKEN"])
      
      expect(github_service.repos_of_user).to be_a(Array)
      expect(github_service.followers_of_user).to be_a(Array)
      expect(github_service.following_of_user).to be_a(Array)
    end
  end

end
