FactoryGirl.define do
  factory :user do
    first_name "Richard"
    last_name "Mejia"
    email "richard@example.com"
    password "hello"
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name "Mejia"
    email "admin@example.com"
    password "admin"
    role "admin"
  end
end
