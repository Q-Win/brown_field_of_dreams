require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth2" do
    stub_omniauth
    
  end
end
