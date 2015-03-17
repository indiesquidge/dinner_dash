FactoryGirl.define do
  factory :order do
    user
    status "cancelled"
    created_at "2015-03-14 15:08:55"

    trait :ordered do
      status "ordered"
    end

    trait :paid do
      status "paid"
    end
  end
end
