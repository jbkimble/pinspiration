FactoryGirl.define do
  factory :comment do
    content "MyText"
    user
    pin
  end
end
