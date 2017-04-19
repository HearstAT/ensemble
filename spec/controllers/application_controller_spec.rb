# frozen_string_literal: true
require 'rails_helper'

# describe ApplicationController do
feature 'access_denied admin', type: :feature do
  scenario 'GET admin pages requires login' do
    visit admin_root_path
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end

feature 'access_denied regular', type: :feature do
  scenario 'GET admin pages requires login' do
    visit pager_duty_reports_path
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end

#  feature 'authenticate_active_admin_user', type: :feature do
#    scenario 'GET admin pages requires admin login' do
#      FactoryGirl.create(:domain)
#      user = FactoryGirl.create(:confirmed_user)
#      login_as(user, :scope => :user)
#      visit admin_business_units_path
#      expect(page).to have_content 'Unauthorized Access!'
#    end
#  end
# end
