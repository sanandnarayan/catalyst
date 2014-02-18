require 'spec_helper'

describe Task do
  let(:task) { FactoryGirl.create(:task) }
  context "Developer" do
    let(:developer) { FactoryGirl.create(:user) }
    let(:task) { FactoryGirl.create(:task, assignee: developer) }
    it "should be able to add time logs" do
      from = DateTime.now - 3.hours 
      to   = DateTime.now
      expect {
        task.timelogs << Timelog.create(from:from, to:to)
      }.to change{task.timelogs.count}.by(1)
    end
    it "should be able to change the state from not started to working to done" do
      task.state.should eq "Not Started"
      task.start
      task.state.should eq "In Progress"
      task.development_done
      task.state.should eq "Done"
    end
  end
  it "#duration" do
    from1 = DateTime.now - 1.hours 
    from2 = DateTime.now - 2.hours 
    from3 = DateTime.now - 3.hours 
    to   = DateTime.now
    timelog1 = FactoryGirl.create(:timelog, from:from1, to:to)
    timelog2 = FactoryGirl.create(:timelog, from:from2, to:to)
    timelog3 = FactoryGirl.create(:timelog, from:from3, to:to)
    task.timelogs << timelog1
    task.timelogs << timelog2
    task.timelogs << timelog3

    task.duration.should eq 6.hours
  end
end
