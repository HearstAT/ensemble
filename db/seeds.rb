# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PagerDutyConfig.all.each do |pd|
  10.times do
    ack_time = rand(60..500)
    PagerDutyIncident.create(business_unit: pd.business_unit,
                             created_on: Faker::Time.between(12.months.ago, Date.today, :all),
                             seconds_to_first_ack: ack_time,
                             seconds_to_resolve: ack_time + rand(60..1000))
  end
end

Domain.create!(domain: 'example.com')
unless User.where(email: 'admin@example.com')
  newuser = User.new(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
  newuser.confirm
  newuser.save!
end
