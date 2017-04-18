FactoryGirl.define do
  factory :pager_duty_report do
    business_unit
    number_of_incidents 1
    active true
    start_date { 12.months.ago }
    end_date { DateTime.now }
  end
end