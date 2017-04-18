
require 'rails_helper'

RSpec.describe PagerDutyConfig do
  it 'should have the correct settings' do
    resource = ActiveAdmin.application.namespaces[:admin].resources['PagerDutyConfig']
    expect(resource.resource_name).to eq 'PagerDutyConfig'
    expect(resource).to be_include_in_menu
    expect(resource.defined_actions).to match_array([:create, :new, :update, :edit, :index, :show, :destroy])
    # expect(resource.scope_to).to eq :current_user
  end
end

RSpec.describe Admin::PagerDutyConfigsController, type: :controller do
  render_views

  before(:each) do
    FactoryGirl.create(:domain)
    user = FactoryGirl.create(:admin_user)
    login_as(user, scope: :user)
    visit new_admin_user_session_path
    fill_in 'Email',    with: 'test@example.com'
    fill_in 'Password', with: 'f4k3p455w0rd'
    click_button 'Login'
  end

  feature 'Logged in access to pager_duty_config', type: :feature do
    scenario 'visitor finds pager_duty_config through links' do
      pdc = FactoryGirl.create(:pager_duty_config)
      get :edit, params: { id: pdc.to_param }
      visit '/admin/pager_duty_configs'
      expect(page).to have_content 'MyString'
    end
  end

  feature 'show', type: :feature do
    scenario 'renders pager_duty_config page' do
      pdc = FactoryGirl.create(:pager_duty_config)
      get :edit, params: { id: pdc.to_param }
      visit '/admin/pager_duty_configs/1'
      expect(page).to have_content 'MyString'
    end
  end

  feature 'edit', type: :feature do
    scenario 'renders pager_duty_config form' do
      pdc = FactoryGirl.create(:pager_duty_config)
      get :edit, params: { id: pdc.to_param }
      visit '/admin/pager_duty_configs/1/edit'
      expect(page).to have_content 'MyString'
    end
  end

  feature 'update', type: :feature do
    scenario 'updates pager_duty_config' do
      pdc = FactoryGirl.create(:pager_duty_config)
      patch :update, id: pdc.to_param
      visit '/admin/pager_duty_configs/1/edit'
      expect(page).to have_content 'MyString'
    end
  end
end
