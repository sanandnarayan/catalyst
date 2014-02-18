require 'spec_helper'

describe Timelog do
  let(:from) { DateTime.now - 3.hours }
  let(:to) { DateTime.now }
  let(:timelog) { FactoryGirl.create(:timelog, from: from, to:to) }
  it "#duration" do
    timelog.duration.should eq 3.hours
  end
end
