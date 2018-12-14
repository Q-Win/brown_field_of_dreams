class GithubInviteService

  def initialize(user_name)
    @username = user_name
  end

  def user_info
    get_json("/users/#{@username}")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.github.com') do |faraday|

      faraday.adapter Faraday.default_adapter
    end
  end
end
