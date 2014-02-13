require 'spec_helper'

describe Story do
  let(:story) {FactoryGirl.create :story}
  let(:task) {FactoryGirl.create :task}
  it "should have many tasks" do
    expect {story.tasks << task}.to change{story.tasks.count}.by 1
  end
end
