class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  
  def add_project(project_name)
    project = Project.new(name: project_name)
    account.projects << project

    make_admin project

    project
  end

  private

  def make_admin(project)
    add_role :admin, project
  end
end
