require 'factory_girl'

Factory.define :user do |u|
  u.name 'Testy'
  u.email 'testy@test.com'
  u.password 'password'
end
