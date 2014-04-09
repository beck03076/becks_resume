FactoryGirl.define do
  sequence :first_name do |n|
    "Wolfgang#{n}"
  end
  sequence :middle_name do |n|
    "Amadeus#{n}"
  end
  sequence :last_name do |n|
    "Mozart#{n}"
  end
  sequence :email do |n|
    "wolfgang#{n}@mozart.com"
  end
  sequence(:date_of_birth) { |n| (Date.new(1985,12,31) + n.days).to_s }
  
  factory :user do
    first_name 
    middle_name
    last_name
    summary "Im a good guy"
  end
  
  factory :enquiry do
    email1 FactoryGirl.generate(:email) 
    first_name 
    surname
    date_of_birth
    active true
  end
  
end
