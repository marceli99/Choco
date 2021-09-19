FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'test123' }
    password_confirmation { 'test123' }
  end
end