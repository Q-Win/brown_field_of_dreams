require 'rails_helper'

describe 'Tutorial show page' do
  it 'loads if Tutorial has no videos'  do
    @user = User.create(email: 'bob@bob.com',first_name: 'bob',
            last_name: "smith", password: 'bob')
    @tutorial_1 = Tutorial.create(title: "fun", description: "wow",
              thumbnail: "nope", playlist_id: "1")


    visit "/tutorials/#{@tutorial_1.id}"
    
    expect(page).to have_content("Videos")
    expect(page).to have_content("This tutorial has no videos")


  end

end
