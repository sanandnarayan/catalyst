class Task < ActiveRecord::Base
  belongs_to :story
  belongs_to :assignee, foreign_key: "assigned_to", :class_name => "User"
  has_many :timelogs
  
  state_machine :initial => "Not Started" do
    after_transition any => any, :do => :story_update
    event :start do
      transition all => "In Progress"
    end
    event :development_done do
      transition all => "Done"
    end
    event :not_started do
      transition all => "Not Started"
    end
  end

  def estimate(time, user)
    if user.cannot?(:manage, project)  
      raise CanCan::AccessDenied
    end
    self.estimated_time = 91
    self.save!
  end

  def story_update
    story.update_status
  end

  def assign(assignee, user)
    if user.cannot?(:manage, project)  
      raise CanCan::AccessDenied
    end
    self.assignee = assignee
    self.save!
  end

  def duration
    durations = timelogs.map(&:duration)
    durations.reduce(:+)
  end
  private
  def project
    story.project
  end
end
