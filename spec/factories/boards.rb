FactoryGirl.define do
  factory :board do
    name "MyText"
    isprivate false
    user
      factory :board_with_pins do
        pins { create_list(:pin, 3)}
      end
  end
end
