# frozen_string_literal: true
require 'rails_helper'

describe PagerDutyReportsController do
  describe 'GET #index' do
    it 'requires login' do
      get :index
      expect(response).to redirect_to '/users/sign_in'
    end
  end
end

feature 'Logged in access to pager duty reports', type: :feature do
  scenario 'visitor finds incident through links' do
    FactoryGirl.create(:domain)
    user = FactoryGirl.create(:confirmed_user)
    login_as(user, scope: :user)
    FactoryGirl.create(:business_unit)
    FactoryGirl.create(:pager_duty_config)
    FactoryGirl.create(:pager_duty_incident)
    FactoryGirl.create(:pager_duty_report)
    visit root_path
    expect(page).to have_content 'MyString'
    click_link 'Show'
    expect(page).to have_content 'MyString'
  end
end
