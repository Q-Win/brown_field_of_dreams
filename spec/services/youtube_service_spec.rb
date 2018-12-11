require 'rails_helper'

describe YoutubeService do

  xit "can get a JSON" do
    VCR.use_cassette("youtube") do
      youtube_service = YoutubeService.new(ENV["GITHUB_SERVICE_TEST_TOKEN"])

      expect(youtube_service.repos_of_user).to be_a(Array)
      expect(youtube_service.followers_of_user).to be_a(Array)
      expect(youtube_service.following_of_user).to be_a(Array)
    end
  end

end
