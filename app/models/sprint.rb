class Sprint < ActiveRecord::Base
  belongs_to :project
  has_many :stories

  def successful?
    story_statuses = stories.map(&:state)
    story_statuses.uniq!
    story_statuses == ["Accepted"] ? true : false
  end
end
