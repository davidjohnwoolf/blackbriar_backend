class TrainingVideosController < ApplicationController
  before_action :authenticate_user, only: [:index, :show]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_training_video, only: [:show, :edit, :update, :destroy]

  def index
    @training_videos = TrainingVideo.all
  end

  def show
  end

  def new
    @training_video = TrainingVideo.new
  end

  def create
    @training_video = TrainingVideo.new(training_video_params)
    if @training_video.save
      flash[:notice] = 'Training video created'
      redirect_to training_videos_url
    else
      flash[:alert] = 'Error creating training video'
      redirect_to new_training_video_url
    end
  end

  def edit
  end

  def update
    if @training_video.update_attributes(training_video_params)
      flash[:notice] = 'Training video updated'
      redirect_to training_videos_url
    else
      flash[:alert] = 'Error updating training video'
      render :edit
    end
  end

  def destroy
    @training_video.destroy
    flash[:notice] = 'Training video deleted'
    redirect_to training_videos_url
  end

  private

  def find_training_video
    @training_video = TrainingVideo.find(params[:id])
  end

  def training_video_params
    params.require(:training_video).permit(:title, :description, :video)
  end
end
