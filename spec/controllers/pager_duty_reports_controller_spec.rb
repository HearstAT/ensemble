require 'rails_helper'

feature 'Logged in access to pager duty reports', type: :feature do
  scenario "visitor finds incident through links" do
    FactoryGirl.create(:domain)
    user = FactoryGirl.create(:confirmed_user)
    login_as(user, :scope => :user)
    pdi = FactoryGirl.create(:pager_duty_incident)
    visit root_path
    expect(page).to have_content "MyString"
    click_link "Show"
    expect(page).to have_content "MyString"
  end
end

describe PagerDutyReportsController do
  describe 'GET #index' do
    it 'requires login' do
      get :index
      expect(response).to redirect_to "/users/sign_in"
    end
  end

end