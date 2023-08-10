require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    let!(:user) { create(:user) }

    it "nameとemail,passwordが存在すればユーザー登録できること" do
      expect(user).to be_valid
    end

    it "nameが入力されていなければエラーが出ること" do
      user.name = ""
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailが~@~の形でなかればエラーがでること" do
      user.email = "sugitaro"
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが6文字未満ならエラーがでること"  do
      user.password = "sugi"
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("は半角英数字6文字以上で入力してください。")
    end

    it "psswordが半角英数字でないならエラーが発生すること" do
      user.password = "ktcb"
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("は半角英数字6文字以上で入力してください。")
    end
  end
end
