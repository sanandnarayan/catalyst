require 'spec_helper'

feature 'Admin adds projects' do
  scenario 'add a project' do
    user = FactoryGirl.create :user
    user.add_role :admin
    project_name = 'Facebook Application'
    visit new_user_session_path
    fill_in 'user_email', with: user.email 
    fill_in 'user_password', with: "password"
    click_button 'Log in'

    expect(page).to have_content "Signed in successfully"

  end
end
