require 'spec_helper'

describe Sprint do
  let (:project) { FactoryGirl.create(:project) }
  let (:sprint) { FactoryGirl.create(:sprint, project: project) }
  it "belongs to a project" do
    sprint.project.should eq project
  end
  it "is successful if all stories are Accepted" do
    story1 = FactoryGirl.create(:story)
    story2 = FactoryGirl.create(:story)
    sprint.stories << story1
    sprint.stories << story2
    story1.state = "Accepted"
    story2.state = "Accepted"

    sprint.should be_successful
  end
  it "is not successful even if one story is not accepted" do
    story1 = FactoryGirl.create(:story)
    story2 = FactoryGirl.create(:story)
    sprint.stories << story1
    sprint.stories << story2
    story2.state = "Accepted"

    sprint.should_not be_successful
  end
end
