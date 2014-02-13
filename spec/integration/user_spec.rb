require 'spec_helper'

describe "User" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }

  describe "adds a project" do
    it "should succeed" do
      project = user.add_project("Project Name")
      project.id.should be_a Integer
    end

    it "becomes admin of the added project" do
      project = user.add_project("Project Name")
      user.should have_role :admin, project
    end
  end
end
