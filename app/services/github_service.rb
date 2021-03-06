class GithubService

  def initialize(token)
    @token = token
  end

  def repos_of_user
    get_json("/user/repos")
  end

  def followers_of_user
    get_json("/user/followers")
  end

  def following_of_user
    get_json("/user/following")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|

      faraday.headers['Authorization'] = "token #{@token}"
      faraday.adapter Faraday.default_adapter
    end
  end

end
