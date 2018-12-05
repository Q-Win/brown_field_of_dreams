class CreateGithubData < ActiveRecord::Migration[5.2]
  def change
    create_table :github_data do |t|
      t.string :token
      t.string :user_name
      t.references :user, foreign_key: true
    end
  end
end
