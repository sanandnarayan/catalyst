module ValidUserRequestHelper
  def sign_in_as_a_admin
    @user ||= FactoryGirl.create :user
    @user.add_role :admin
    visit new_user_session_path
    fill_in 'user_email', with: @user.email 
    fill_in 'user_password', with: "password"
    click_button 'Log in'
    @user
  end
end

RSpec.configure do |config|
  config.include ValidUserRequestHelper, :type => :feature
end
