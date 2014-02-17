class Timelog < ActiveRecord::Base
  belongs_to :task
  def duration
    to - from
  end
end
