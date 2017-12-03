class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @projects = Project.new
  end

  def create
    @project = Project.create!(params.require(:project).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Item created.'}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(params.require(:project).permit(:title, :subtitle, :body))
        format.html { redirect_to projects_path, notice: 'Item created.'}
      else
        format.html { render :new }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Record was removed.' }
    end
  end

end
