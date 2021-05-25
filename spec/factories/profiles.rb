FactoryBot.define do
  factory :profile do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/spec_test.jpg')) }
    user_name { "テスト" }
    address { "東京都" }
    cat_name { "みけ" }
    age { "3歳" }
    introduction { "初めまして。よろしくお願いします。" }
  end
end
