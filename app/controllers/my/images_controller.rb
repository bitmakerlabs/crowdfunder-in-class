class My::ImagesController < ApplicationController

  before_filter :get_project

  def index
    @images = @project.images.order(:id)
    @image = @project.images.build
    # Image.new :project => @project
  end

  def create
    @image = @project.images.build(params[:image])
    if @image.save
      # redirect_to [:my, @project, :images]
      # redirect_to "/my/project/#{@project.id}/images"
      redirect_to my_project_images_path(@project)
    else
      @images = @project.images.order(:id)
      render :index
    end
  end

  def get_project
    @project = Project.find(params[:project_id])
  end
end
