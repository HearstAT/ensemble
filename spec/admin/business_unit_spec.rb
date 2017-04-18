require 'rails_helper'

RSpec.describe BusinessUnit do
  it 'should have the correct settings' do
    resource = ActiveAdmin.application.namespaces[:admin].resources["BusinessUnit"]
    expect(resource.resource_name).to eq 'BusinessUnit'
    expect(resource).to be_include_in_menu
    expect(resource.defined_actions).to match_array([:create, :new, :update, :edit, :index, :show, :destroy])
    #expect(resource.scope_to).to eq :current_user
  end
end

RSpec.describe Admin::BusinessUnitsController, type: :controller do
  render_views

  before(:each) do
    FactoryGirl.create(:domain)
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit new_admin_user_session_path
    fill_in 'Email',    with: 'test@example.com'
    fill_in 'Password', with: 'f4k3p455w0rd'
    click_button 'Login'
  end

  feature 'Logged in access to business_unit', type: :feature do
    scenario "Navigate to business_unit index" do
      bu = FactoryGirl.create(:business_unit)
      get :edit, params: { id: bu.to_param }
      visit admin_business_units_url
      expect(page).to have_content "MyString"
    end
  end

  feature 'show', type: :feature do
    scenario 'renders business_unit page' do
      bu = FactoryGirl.create(:business_unit)
      get :edit, params: { id: bu.to_param }
      visit admin_business_unit_path(bu.id)
      expect(page).to have_content "MyString"
    end
  end

  feature 'edit', type: :feature do
    scenario 'renders business_unit form' do
      bu = FactoryGirl.create(:business_unit)
      get :edit, params: { id: bu.to_param }
      visit edit_admin_business_unit_path(bu.id)
      expect(page).to have_content "MyString"
    end
  end

  feature 'update', type: :feature do
    scenario 'updates pager_duty_config' do
      bu = FactoryGirl.create(:business_unit)
      patch :update, { id: bu.to_param}
      visit '/admin/business_units/1/edit'
      expect(page).to have_content "MyString"
    end
  end

end
