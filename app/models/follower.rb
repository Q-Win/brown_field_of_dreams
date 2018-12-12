class Follower
  attr_reader :handle, :url, :github_id

  def initialize(follower_data)
    @handle = follower_data[:login]
    @url = follower_data[:html_url]
    @github_id = follower_data[:id]
  end

end
