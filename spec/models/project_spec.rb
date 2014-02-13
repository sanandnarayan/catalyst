require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }
  let(:story) {FactoryGirl.create :story}
  it "should have many stories" do
    expect {project.stories << story}.to change{project.stories.count}.by 1
  end
end
