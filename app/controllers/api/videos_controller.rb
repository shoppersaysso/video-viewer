class API::VideosController < ApplicationController

  def index
    videos = Video.all
    render json: videos, status: 200
  end

  def create
    video = Video.new(video_params)
    if video.save
      render json: video, status: 201
    else
      render json: {
        errors: {
          messages: video.errors.messages
          }
        }, status: 422
    end
  end

  def show
    video = Video.find(params[:id])
    if video
      render json: video, status: 200
    else
      render json: {
        errors: {
          messages: { video: "Can't be found"}
          }
        }, status: 404
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :youtube_video_id)
  end

end
