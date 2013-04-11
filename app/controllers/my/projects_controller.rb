class My::ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
  end

  def edit
  end

end
