class Project < ActiveRecord::Base
  resourcify
  belongs_to :account
  has_many :stories
  has_many :sprints
end
