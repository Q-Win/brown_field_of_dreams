class AddGithubId < ActiveRecord::Migration[5.2]
  def change
    add_column :github_data, :github_id, :integer
  end
end
