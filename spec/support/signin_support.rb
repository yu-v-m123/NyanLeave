module SigninSupport
  def signin(user)
    visit root_path
    first(".btn").click
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
end

RSpec.configure do |config|
  config.include SigninSupport
end