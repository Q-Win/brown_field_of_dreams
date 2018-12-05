class GithubFacade

  def initialize
    @_repos = nil
  end

  def repos
    # binding.pry
    repo_results.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  private

  def repo_results
    @_repos ||= service.repos_of_user
  end

  def service
    GithubService.new
  end


end
