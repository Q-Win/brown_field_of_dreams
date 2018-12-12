class GithubUser
  attr_reader :handle, :url

  def initialize(github_user_data)
    @handle = github_user_data[:login]
    @url = github_user_data[:html_url]
  end

end
