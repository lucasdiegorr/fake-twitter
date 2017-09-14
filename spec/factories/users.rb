FactoryGirl.define do
  factory :user do
		first_name { Faker::Name.name }
		last_name { Faker::Name.name }
		email { Faker::Internet.email }
		password { 'q1w2e3r4' }
		password_confirmation { 'q1w2e3r4' }
  end
end