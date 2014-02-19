class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Project if user.has_role? :admin

    project_admin = Project.with_role(:admin, user).pluck(:id)
    can :manage, Project, :id => project_admin

    project_developer = Project.with_role(:developer, user).pluck(:id)
    can :read, Project, :id => project_developer
  end
end
