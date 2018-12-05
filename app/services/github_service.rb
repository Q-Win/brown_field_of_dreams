class GithubService

  # def initialize(filter)
  #   @filter = filter
  # end

  def repos_of_user
    get_json("/user/repos")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|

      faraday.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"

      # binding.pry
      faraday.adapter Faraday.default_adapter
    end
  end

end
