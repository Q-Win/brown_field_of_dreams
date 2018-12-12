require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password)}
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'methods' do
    it 'sorts videos' do
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

      sorted_videos = @user.sort_videos
      
      expect(sorted_videos).to eq([@video_2, @video_3, @video_1, @video_4])
    end
  end
end
