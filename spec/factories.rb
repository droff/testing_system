FactoryGirl.define do
  factory :admin_user, class: User do
    email 'admin@example.com'
    password 'password'
  end
end
