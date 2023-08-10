require 'rails_helper'
RSpec.describe KDorama, type: :model do
  let!(:k_dorama) { create(:k_dorama) }
  it "すべての項目が埋まっていれば、k_doramaを作れること" do
    expect(k_dorama).to be_valid
  end

  it "titleが入力されていなければエラーが出ること" do
    k_dorama.title = ""
    expect(k_dorama).to be_invalid
    expect(k_dorama.errors[:title]).to include("を入力してください")
  end

  it "introductionが入力されていなければエラーが出ること" do
    k_dorama.introduction = ""
    expect(k_dorama).to be_invalid
    expect(k_dorama.errors[:introduction]).to include("を入力してください")
  end
end
