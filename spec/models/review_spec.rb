require 'rails_helper'
RSpec.describe Review, type: :model do
  let!(:review) { create(:review) }
  it "すべての項目が埋まっていれば、レビューを投稿できること" do
    expect(review).to be_valid
  end

  it "感想が入力されていなければエラーが出ること" do
    review.impression = ""
    expect(review).to be_invalid
    expect(review.errors[:impression]).to include("を入力してください")
  end

  it "星が入力されていなければエラーが出ること" do
    review.evaluation = ""
    expect(review).to be_invalid
    expect(review.errors[:evaluation]).to include("を入力してください")
  end
end
