class TutorialsController < ApplicationController
  def show
    tutorial = Tutorial.find(params[:id])
    if tutorial.videos.where(position: nil).count > 0
      render file: 'errors/not_found', status: 404
    end
    @facade = TutorialFacade.new(tutorial, params[:video_id])
  end
end
