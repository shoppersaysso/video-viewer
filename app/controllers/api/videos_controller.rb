class API::VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]

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
    if @video
      render json: @video, status: 200
    else
      render json: {
        errors: {
          messages: { video: "Can't be found"}
          }
        }, status: 404
    end
  end

  def update
    if @video.update(video_params)
      render json: @video, status: 200
    else
      render json: {
        errors: {
          messages: { video: "unable to update"}
          }
        }, status: 404
    end
  end

  def destroy
    @video.destroy
    :no_content
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :youtube_video_id)
  end

end
