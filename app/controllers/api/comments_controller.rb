class API::CommentsController < ApplicationController
  before_action :set_video, only: [:show, :create, :destroy]
  before_action :set_comment, only: [:destroy]

  def index
    render :json @video.comments, status: 200
  end

  def create
    @comment = @video.comments.build(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: {
        errors: {
          messages: @comment.errors.messages
          }
        }, status: 422
    end
  end

  def destroy
    @comment.destroy
    :no_content
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end

  def set_comment
    @comment = @video.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end


end
