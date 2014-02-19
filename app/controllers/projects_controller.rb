class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'project was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  private

  def project_params
    params.require(:project).permit(:name)
  end
end
