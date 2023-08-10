require 'rails_helper'
RSpec.describe Like, type: :system do
  let!(:like) { create(:like) }
  describe 'いいね', js: true do
    context 'いいねボタンが押されている時' do
      before do
        login(like.user)
        visit k_dorama_path(like.review.k_dorama)
      end
      it 'いいねボタンが押されるとハートがグレーになること' do
        find("#likes_#{like.review.id}").click
        expect(page).to have_selector '.unlike-btn'
      end
      it 'いいねボタンを押すとカウントが1減ること' do
        expect {
          find("#likes_#{like.review.id}").click
          expect(page).to have_selector '.unlike-btn'
        }.to change { Like.count }.by(-1)
      end
    end
    context 'いいねボタンが押されていない時' do
      before do
        login(like.user)
        visit k_dorama_path(like.review.k_dorama)
        find("#likes_#{like.review.id}").click
        find'.like_link'
      end
      it 'いいねボタンが押されるとハートが赤になること' do
        find("#likes_#{like.review.id}").click
        expect(page).to have_selector '.like-btn'
      end
      it 'いいねボタンを押すとカウントが1増えること' do
        expect {
          find("#likes_#{like.review.id}").click
          expect(page).to have_selector '.like-btn'
        }.to change { Like.count }.by(1)
      end
    end
  end
end
