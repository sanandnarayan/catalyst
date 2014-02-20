class StoriesController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    @story = project.stories.create(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to project_path(@story.project), notice: 'story was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  private
  def story_params
    puts params
    params.require(:story).permit(:name, :project_id)
    params.require(:story).permit(:name, :project_id)
  end
end
