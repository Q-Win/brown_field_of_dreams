require 'rails_helper'

RSpec.describe Repo, type: :model do

  describe 'model' do
    it 'exists' do
      repo_data = {:name => "cat", :html_url => "cat.com"}
      test_repo = Repo.new(repo_data)

      expect(test_repo.name).to eq('cat')
      expect(test_repo.url).to eq('cat.com')
    end
  end

end
