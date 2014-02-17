class Task < ActiveRecord::Base
  belongs_to :story
  belongs_to :assignee, foreign_key: "assigned_to", :class_name => "User"

  def estimate(time, user)
    if user.cannot?(:manage, project)  
      raise CanCan::AccessDenied
    end
    self.estimated_time = 91
    self.save!
  end

  def assign(assignee, user)
    if user.cannot?(:manage, project)  
      raise CanCan::AccessDenied
    end
    self.assignee = assignee
    self.save!
  end
  private
  def project
    story.project
  end
end
