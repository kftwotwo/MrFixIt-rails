FactoryGirl.define do
  factory :worker do
    email "test@test.com"
    password "123456"
    password_confirmation "123456"
  end
end
