FactoryGirl.define do
  factory :user do
    first_name "Richard"
    last_name  "Mejia"
    email      "richard@example.com"
    password   "hello"
    role       0
  end
end
