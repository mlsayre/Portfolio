class ProjectsController < ApplicationController
  def frontpage
    @projects = Project.all
  end

  def index
    @projects = Project.all
  end

  def new
    @projects = Project.all
    @project = Project.new
  end

  def create
    @projects = Project.all
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project was successfully added."
      redirect_to @project
    else
      flash[:alert] = "Project could not be saved."
      render action: "new"
    end
  end

  def show
    @projects = Project.all
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def update
    @projects = Project.all
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      flash[:alert] = "Project could not be saved."
      render :edit
    end
  end

  def edit
    @projects = Project.all
    @project = Project.find(params[:id])
  end

  def destroy
    @projects = Project.all
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

end
