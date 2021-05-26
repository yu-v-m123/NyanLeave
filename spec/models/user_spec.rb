require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  describe "新規登録" do
    context "バリデーション" do
      it "メールアドレスとパスワードで登録可能" do
        expect(user).to be_valid
      end
    end

    context "メールアドレスのバリデーション" do
      it "メールアドレスが空白の場合は無効" do
        user.email = ""
        expect(user).not_to be_valid
      end
      it "メールアドレスに@がない場合は無効" do
        user.email = "test"
        expect(user).not_to be_valid
      end
      it "メールアドレスが6文字未満の場合は無効" do
        user.email = "a" + "@com"
        expect(user).not_to be_valid
      end
      it "メールアドレスが129文字以上の場合は無効" do
        user.email = "a" * 125 + "@com"
        expect(user).not_to be_valid
      end
      it "メールアドレスのフォーマットが不正な場合は無効" do
        expect(FactoryBot.build(:user, email: "test@example,com")).not_to be_valid
        expect(FactoryBot.build(:user, email: "test.example,com")).not_to be_valid
        expect(FactoryBot.build(:user, email: "test@+example.com")).not_to be_valid
      end
      it "メールアドレスが重複している場合は無効" do
        FactoryBot.create(:user, email: "test1@example.com")
        user1 = User.new(email: "test1@example.com")
        user1.valid?
        expect(user1.errors[:email]).to include("はすでに登録されているにゃ")
      end
    end

    context "パスワードのバリデーション" do
      it "パスワードが空白の場合は無効" do
        user.password = ""
        expect(user).not_to be_valid
      end
      it "パスワードが6文字未満の場合は無効" do
        user.password = "aaaaa"
        expect(user).not_to be_valid
      end
      it "パスワードが129文字以上の場合は無効" do
        user.password = "a" * 129
        expect(user).not_to be_valid
      end
      it "確認用パスワードが空白の場合は無効" do
        user.password_confirmation = ""
        expect(user).not_to be_valid
      end
      it "パスワードと確認用パスワードが一致しない場合は無効" do
        user1 = User.new(password: "123456", password_confirmation: "1234567")
        user1.valid?
        expect(user1.errors[:password_confirmation]).to include("とパスワードの入力が一致しないにゃ")
      end
    end
  end
end
