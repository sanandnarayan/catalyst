require 'spec_helper'
require 'request_helper'

feature 'Admin' do
  scenario 'sbat login' do
    sign_in_as_a_admin
    expect(page).to have_content "Signed in successfully"
  end
  scenario 'can see his projects' do
    project1 = FactoryGirl.create :project, name: "Project1" 
    project2 = FactoryGirl.create :project, name: "Project2"
    project3 = FactoryGirl.create :project, name: "Project3"

    user = sign_in_as_a_admin
    expect(page).to have_content project1.name
    expect(page).to have_content project2.name
    expect(page).to have_content project3.name
  end
  scenario 'can add a project' do
    user = sign_in_as_a_admin
    click_link "Add Project"
    expect(page).to have_content "Add Project"

    fill_in 'project_name', with: "Awesome project"
    click_button "Add Project"
    expect(page).to have_content "Awesome project"
  end
end
