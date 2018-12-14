require 'rails_helper'

describe 'About show page' do
  it 'loads if app info'  do

    visit "/about"

    expect(page).to have_content("This application is designed to pull in youtube information to populate tutorials from Turing School of Software and Design's youtube channel")
  end

end
