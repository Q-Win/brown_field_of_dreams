class GithubData < ApplicationRecord
  belongs_to :user

  def self.associated_user(follower)
    data = find_by(github_id: follower.github_id)
  end
end
