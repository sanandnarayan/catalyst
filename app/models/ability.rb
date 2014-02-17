class Ability
  include CanCan::Ability

  def initialize(user)
    project_admin = Project.with_role(:admin, user).pluck(:id)
    can :manage, Project, :id => project_admin
  end
end
