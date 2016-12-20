FactoryGirl.define do
  factory :pin do
    source "MyText"
    sequence :name do |n|
      "pin #{n}"
    end
    image "MyText"
  end
end
