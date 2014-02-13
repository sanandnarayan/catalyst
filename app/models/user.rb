class User < ActiveRecord::Base
  # delegate :can?, :cannot?, :to => :ability
  
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

  def can?(action, resource=nil, conditions=nil)
    # TODO refactor this
    @ability ||= Ability.new(self, action, resource, conditions)
    @ability.can? action, resource
  end

  private

  def make_admin(project)
    add_role :admin, project
  end
end
