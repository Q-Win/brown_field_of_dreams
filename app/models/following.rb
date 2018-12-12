class Following
  attr_reader :handle, :url, :github_id

  def initialize(following_data)
    @handle = following_data[:login]
    @url = following_data[:html_url]
    @github_id = following_data[:id]
  end

end
