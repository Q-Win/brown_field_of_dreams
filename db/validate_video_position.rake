namespace :position do

  task videos: :environment do
    videos_with_nil_position = Video.where(position: nil)
    videos_with_nil_position.each do |video|
      video.update(position: 0)
    end
  end
end
