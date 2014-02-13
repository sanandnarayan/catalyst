class Task < ActiveRecord::Base
  belongs_to :story

  def estimate(time, user)
    if user.can?(:manage, project)  
      self.estimated_time = 91
      self.save!
    end
  end

  private
  def project
    story.project
  end
end
