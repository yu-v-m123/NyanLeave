require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    before do
      get signup_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status 200
      expect(response).to be_successful
    end
    it "正常に会員登録画面の表示ができているか" do
      expect(response.body).to include "会員登録"
      expect(response.body).to include "Eメール"
      expect(response.body).to include "パスワード"
      expect(response.body).to include "確認用パスワード"
      expect(response.body).to include "既にアカウントをお持ちの方"
    end
  end

  describe "GET /signin" do
    before do
      get signin_path
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status 200
      expect(response).to be_successful
    end
    it "正常にログイン画面の表示ができているか" do
      expect(response.body).to include "ログイン"
      expect(response.body).to include "Eメール"
      expect(response.body).to include "パスワード"
      expect(response.body).to include "初めての登録ですか？"
    end
  end

  describe "GET /users/show" do
    let(:user) { create :user }
    let!(:profile) { create :profile, user_id: user.id }

    before do
      signin(user)
      get user_path(user.id)
    end

    it "正常なレスポンスを返すこと" do
      expect(response).to have_http_status 200
      expect(response).to be_successful
    end
    it "正常に登録情報変更画面の表示ができているか" do
      expect(response.body).to include "マイページ"
      expect(response.body).to include "飼い主さん : テスト"
      expect(response.body).to include "東京都"
      expect(response.body).to include "みけ"
      expect(response.body).to include "3歳"
      expect(response.body).to include "自己紹介"
      expect(response.body).to include "初めまして。よろしくお願いします。"
    end
  end
end
