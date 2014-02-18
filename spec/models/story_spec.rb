require 'spec_helper'

describe Story do
  let(:story) {FactoryGirl.create :story}
  let(:task) {FactoryGirl.create :task}
  it "should have many tasks" do
    expect {story.tasks << task}.to change{story.tasks.count}.by 1
  end
  it "status is not started when none of its tasks are started" do
    story.state.should eq "Not Started"
  end
  it "status is started when none of its tasks are started" do
    task1 = FactoryGirl.create :task
    story.tasks << task1
    task1.start
    story.reload
    story.state.should eq "In Progress"
  end
  it "status is not started when all of its tasks are not started" do
    task1 = FactoryGirl.create :task
    story.tasks << task1
    task1.start
    task1.reload
    task1.not_started
    story.reload
    story.state.should eq "Not Started"
  end
  it "status is codereview when all of its tasks are qa" do
    task1 = FactoryGirl.create :task
    task2 = FactoryGirl.create :task
    story.tasks << task1
    story.tasks << task2

    task1.development_done
    task2.development_done

    story.reload
    story.state.should eq "Code Review"
  end
  it "status is qa when it has been codereviewed" do
    task1 = FactoryGirl.create :task
    task2 = FactoryGirl.create :task
    story.tasks << task1
    story.tasks << task2

    task1.development_done
    task2.development_done

    story.reload
    story.code_reviewed
    story.reload
    story.state.should eq "Testing"
  end
  it "status is deploy once qa has passed" do
    story.state = "Testing"
    story.qa_passed
    story.reload 
    story.state.should eq "Deploy"
  end
  it "status is delivered once deployed" do
    story.state = "Deploy"
    story.deployed
    story.reload 
    story.state.should eq "Delivered"
  end
  it "status is accepted/rejected once delivered" do
    story.state = "Delivered"
    story.accepted
    story.reload 
    story.state.should eq "Accepted"
  end
  it "can be rejected with a reason" do
    story.state = "Delivered"
    story.reject "Bug is there"
    story.reload 
    story.state.should eq "Rejected"
    story.rejections.first.reason.should eq "Bug is there"
  end
end
