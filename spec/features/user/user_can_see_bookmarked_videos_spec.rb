require 'rails_helper'

describe 'A registered user profile' do
  it 'displays bookmarked videos' do
    @user = User.create(email: 'bob@bob.com',first_name: 'bob',
            last_name: "smith", password: 'bob')
    @tutorial_1 = Tutorial.create(title: "fun", description: "wow",
              thumbnail: "nope", playlist_id: "1")
    @tutorial_2 = Tutorial.create(title: "joy", description: "wow",
              thumbnail: "nope", playlist_id: "2")
    @video_1 = @tutorial_2.videos.create(title: "first", description:
                "fun", video_id: "1", thumbnail: 'nope')
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

    visit '/login'

    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_on 'Log In'
    
    expect(page).to have_content(@video_1.title)
    expect(page).to have_content(@video_2.title)
    expect(page).to have_content(@video_3.title)
    expect(page).to have_content(@video_4.title)
  end

end
