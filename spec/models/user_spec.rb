require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:story) {FactoryGirl.create :story}
  let(:task) {FactoryGirl.create :task}

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


  context "when mananger" do
    let(:project) {user.add_project("Project 1")}
    let(:assignee) { FactoryGirl.create :user }
    it "can estimate a task in mins" do
      task.story.project = project
      task.estimate(91, user)
      task.estimated_time.should eq 91
    end
    it "can assign a task to a user" do
      task.story.project = project
      task.assign(assignee, user)
      task.assignee.should eq assignee
    end
  end

  context "when not a manager" do
    let(:assignee) { FactoryGirl.create :user }
    it "cannot estimate the tasks" do
      user = FactoryGirl.create :user
      expect { task.estimate(91, user) }.to raise_error(CanCan::AccessDenied)
    end
    it "cannot assign a task to some user" do
      expect { task.assign(assignee, user) }.to raise_error
    end
  end
end
