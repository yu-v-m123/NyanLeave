FactoryBot.define do
  factory :direct_message do
    user { nil }
    room { nil }
    message { "MyString" }
  end
end
