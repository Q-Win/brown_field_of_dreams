require 'rails_helper'

describe 'Tutorial show page' do
  it '404s if video has nil position' do
    @user = User.create(email: 'bob@bob.com',first_name: 'bob',
            last_name: "smith", password: 'bob')
    @tutorial_1 = Tutorial.create(title: "fun", description: "wow",
              thumbnail: "nope", playlist_id: "1")
    @tutorial_2 = Tutorial.create(title: "joy", description: "wow",
              thumbnail: "nope", playlist_id: "2")
    @video_1 = @tutorial_2.videos.create(title: "first", description:
                "fun", video_id: "1", thumbnail: 'nope', position: nil)
    @video_2 = @tutorial_1.videos.create(title: "2nd", description:
                "fun", video_id: "3", thumbnail: 'nope')
    @video_3 = @tutorial_1.videos.create(title: "3rd", description:
                "fun", video_id: "4", thumbnail: 'nope')
    @video_4 = @tutorial_2.videos.create(title: "4th", description:
                "fun", video_id: "4", thumbnail: 'nope')
    @video_5 = @tutorial_2.videos.create(title: "Should not come in", description:
                "fun", video_id: "5", thumbnail: 'nope')
    @user_video_1 = UserVideo.create(user_id: @user.id, video_id: @video_1.id)
    @user_video_2 = UserVideo.create(user_id: @user.id, video_id: @video_2.id)
    @user_video_3 = UserVideo.create(user_id: @user.id, video_id: @video_3.id)
    @user_video_4 = UserVideo.create(user_id: @user.id, video_id: @video_4.id)

    visit "/tutorials/#{@tutorial_2.id}"

    expect(page).to have_content("The page you're looking for could not be found")

    visit "/tutorials/#{@tutorial_1.id}"
  
    expect(page).to have_content(@video_3.title)

  end

end
