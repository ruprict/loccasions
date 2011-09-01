require 'factory_girl'

FactoryGirl.define do 
  factory :user do 
    name 'Testy'
    email 'testy@test.com'
    password 'password'
  end

  factory :event do
    name "Test Event"
    user 
  end

end
