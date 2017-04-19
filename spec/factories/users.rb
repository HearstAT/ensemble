# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'

    # if needed
    # is_active true
  end

  factory :confirmed_user, parent: :user do
    after(:create, &:confirm)
  end

  factory :admin_user, parent: :confirmed_user do
    admin true
  end
end
