class Story < ActiveRecord::Base
  belongs_to :project
  belongs_to :sprint
  has_many :tasks
  has_many :rejections

  state_machine :initial => "Not Started" do
    event :start do
      transition all => "In Progress"
    end
    event :not_started do
      transition all => "Not Started"
    end
    event :all_tasks_done do
      transition all => "Code Review"
    end
    event :code_reviewed do
      transition "Code Review" => "Testing"
    end
    event :qa_passed do
      transition "Testing" => "Deploy"
    end
    event :deployed do
      transition "Deploy" => "Delivered"
    end
    event :accepted do
      transition "Delivered" => "Accepted"
    end
    event :rejected do
      transition "Delivered" => "Rejected"
    end
  end

  def update_status
    tasks_statuses = tasks.map(&:state)
    tasks_statuses.uniq!
    if tasks_statuses.include? "In Progress"
      # IF any tasks is still in progress, then the story is in progress as well
      start
      return
    end
    if tasks_statuses == ["Not Started"]
      # none of the tasks are completed
      not_started
      return
    end
    if tasks_statuses == ['Done']
      # all of the tasks are completed
      all_tasks_done
      return
    end
  end
  def reject(reason)
    rejections << Rejection.create(reason: reason)
    rejected
  end
end
