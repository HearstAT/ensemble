require 'rails_helper'

RSpec.describe User do
  it 'should have the correct settings' do
    resource = ActiveAdmin.application.namespaces[:admin].resources["User"]
    expect(resource.resource_name).to eq 'User'
    expect(resource).to be_include_in_menu
    expect(resource.defined_actions).to match_array([:create, :new, :update, :edit, :index, :show, :destroy])
    #expect(resource.scope_to).to eq :current_user
  end

end

RSpec.describe Admin::UsersController, type: :controller do
  render_views

  before(:each) do
    FactoryGirl.create(:domain)
    @user = FactoryGirl.create(:admin_user)
    login_as(@user, :scope => :user)
    visit new_admin_user_session_path
    fill_in 'Email',    with: 'test@example.com'
    fill_in 'Password', with: 'f4k3p455w0rd'
    click_button 'Login'
  end

  feature 'list users', type: :feature do
    scenario "visitor finds user through links" do
      visit admin_users_url
      expect(page).to have_content @user.email
    end
  end

  feature 'show user', type: :feature do
    scenario 'renders user configuration page' do
      visit admin_user_path(@user.id)
      expect(page).to have_content @user.email
    end
  end

  feature 'edit user', type: :feature do
    scenario 'renders user configuration form' do
      visit edit_admin_user_path(@user.id)
      expect(page).to have_content 'Email'
    end
  end

end
