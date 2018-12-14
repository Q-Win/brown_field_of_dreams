require 'rails_helper'

describe 'Get Started show page' do
  it 'loads how to get started info'  do

    visit "/get_started"

    expect(page).to have_content("Browse tutorials from the")
  end

end
