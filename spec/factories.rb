FactoryGirl.define do
  factory :user do
    name          "Brent Raines"
    email         "bt.raines@gmail.com"
    relation      "groom"
    password      "foobar"
    password_confirmation "foobar"
  end
end