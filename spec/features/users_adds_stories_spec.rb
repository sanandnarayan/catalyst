require 'spec_helper'
require 'request_helper'

feature "user sbat add stories" do
  let!(:project) { FactoryGirl.create(:project, name: "harmoney") }
  scenario "to a project" do
    sign_in_as_a_admin
    click_link project.name
    expect(page).to have_content project.name
    
    story_name = "usbat add a awesome feature"
    fill_in 'story_name', with: story_name
    click_button 'Add Story'
    expect(page).to have_content story_name
  end
end
