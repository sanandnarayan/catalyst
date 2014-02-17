class Task < ActiveRecord::Base
  belongs_to :story

  def estimate(time, user)
    if user.cannot?(:manage, project)  
      raise CanCan::AccessDenied
    end
    self.estimated_time = 91
    self.save!
  end

  private
  def project
    story.project
  end
end
