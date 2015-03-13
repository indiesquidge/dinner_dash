FactoryGirl.define do
  factory :user do
    first_name "Richard"
    last_name "Mejia"
    email "richard@example.com"
    password "hello"
  end

  factory :admin do
    first_name "Phil"
    last_name "Cat"
    email "cat@example.com"
    password "hello"
    role "admin"
  end
end
