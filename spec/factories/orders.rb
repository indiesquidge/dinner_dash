FactoryGirl.define do
  factory :order do
    user
    status "ordered"
    created_at "2015-03-14 15:08:55"
    updated_at "2015-03-15 10:06:24"
  end
end
