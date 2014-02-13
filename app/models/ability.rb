class Ability
  include CanCan::Ability

  def initialize(user, action, resource, conditions)
    if user.has_role? :admin, resource
      project_admin = Project.with_role(:admin, user).pluck(:id)
      can :manage, Project, :id => project_admin
    end
  end
end
