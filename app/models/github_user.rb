class GithubUser
  attr_reader :handle, :url, :github_id

  def initialize(github_user_data)
    @handle = github_user_data[:login]
    @url = github_user_data[:html_url]
    @github_id = github_user_data[:id]
  end

end
