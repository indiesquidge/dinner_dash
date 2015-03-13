FactoryGirl.define do
  factory :order do
    user
    status "ordered"
  end
end
