require 'rails_helper'

describe GithubService do

  it "can get a JSON" do
    VCR.use_cassette("github_facade") do
      github_facade = GithubFacade.new(ENV["GITHUB_SERVICE_TEST_TOKEN"])
      
      expect(github_facade.repos).to be_a(Array)
      expect(github_facade.followers).to be_a(Array)
      expect(github_facade.following).to be_a(Array)
      expect(github_facade.repos.count).to eq(30)
      expect(github_facade.followers.count).to eq(15)
      expect(github_facade.following.count).to eq(30)
    end
  end

end
