class GithubFacade

  def initialize(token)
    @_repos = nil
    @_followers = nil
    @_following = nil
    @token = token 
  end

  def repos
    repo_results.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def followers
    follower_results.map do |follower_data|
      Follower.new(follower_data)
    end
  end

  def following
    following_results.map do |following_data|
      Following.new(following_data)
    end
  end

  private

  def repo_results
    @_repos ||= service.repos_of_user
  end

  def follower_results
    @_followers ||= service.followers_of_user
  end

  def following_results
    @_following ||= service.following_of_user
  end

  def service
    GithubService.new(@token)
  end


end
