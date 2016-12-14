FactoryGirl.define do
  factory :user do
    name "MyString"
    sequence :email do |n|
      "user#{n}@example.com"
    end
    sequence :username do |n|
      "user#{n}"
    end
    password "MyString"
    phone "MyString"
    roles {[FactoryGirl.create(:role, name: "user")]}
  end
end
