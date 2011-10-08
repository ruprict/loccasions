FactoryGirl.define do 
  factory :user do 
    name 'Testy'
    email 'testy@test.com'
    password 'password'
  end

  factory :event do
    name "Test Event"
    description "This is a Test Event"
    user 
  end

end
