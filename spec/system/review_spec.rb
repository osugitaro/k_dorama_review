require 'rails_helper'
RSpec.describe Review, type: :system do
  let!(:review) { create(:review) }
  let!(:review2) { create(:review, :review2) }
  let!(:k_dorama2) { create(:k_dorama, :k_dorama2) }
  describe 'ドラマの詳細ページ' do
    describe 'レビュー項目' do
      context '感想一覧', js: true do
        before do
          visit k_dorama_path(review.k_dorama)
        end
        it 'ドラマの感想が表示されていること。' do
          expect(page).to have_selector(".active",text:'面白かった')
        end
        it 'レビューのユーザー名が表示されていること' do
          expect(page).to have_selector(".active", text: review.user.name)
        end
        it 'レビューの作成時間が表示されるていること' do
          expect(page).to have_selector(".active", text: review.updated_at.to_s(:datetime_jp))
        end
      end
      context 'このドラマがおすすめな人', js: true do
        before do
          visit k_dorama_path(review.k_dorama)
          click_on "このドラマがおすすめな人"
        end
        it 'このドラマがおすすめ人のレビューが表示されること' do
          expect(page).to have_selector(".active", text: review.recommendation)
        end
        it 'レビューのユーザー名が表示されていること ' do
          expect(page).to have_selector(".active", text: review.user.name)
        end
        it 'レビューの作成時間が表示されていること' do
          expect(page).to have_selector(".active", text: review.updated_at.to_s(:datetime_jp))
        end
      end
      context 'このドラマをおすすめできない人', js: true do
        before do
          visit k_dorama_path(review.k_dorama)
          click_on "このドラマをおすすめできない人"
        end
        it 'このドラマをおすすめできない人のレビューが表示されていること' do
          expect(page).to have_selector(".active", text: review.not_recommendation)
        end
        it 'レビューのユーザー名が表示されていること' do
          expect(page).to have_selector(".active", text: review.user.name)
        end
        it 'レビューの作成時間が表示されていること' do
          expect(page).to have_selector(".active", text: review.updated_at.to_s(:datetime_jp))
        end
      end
      context '途中ざせつしてしまった人の意見', js: true do
        before do
          visit k_dorama_path(review2.k_dorama)
          click_on "途中でざせつしてしまった人の意見"
        end
        it '途中で挫折してしまった人の意見が表示されること' do
          expect(page).to have_selector(".active", text: "つまらなかった")
        end
      end
    end
    describe "レビューリンク" do
      context "ログインしていない時" do
        before do
          visit k_dorama_path(review.k_dorama)
        end
        it 'レビューするを押すと、ログイン画面に遷移すること' do
          click_on 'レビューする'
          expect(current_path).to eq new_user_session_path
        end
      end
      context "ログインしている時" do
        before do
          login(review.user)
          visit k_dorama_path(review.k_dorama)
        end
        it 'レビューするを押すとレビュー投稿画面に遷移すること' do
          click_on 'レビューする'
          expect(current_path).to eq new_review_path
        end
      end
    end
    describe "レビュー投稿" do
      context '投稿成功', js: true do
        before do
          login(review.user)
          visit k_dorama_path(k_dorama2)
          click_on "レビューする"
        end
        it "必須項目を埋めればレビュー投稿が成功すること" do
          choose "see_all"
          fill_in '感想', with: '感動した。'
          find('#star').find("img[alt='5']").click
          click_on 'レビューする'
          expect(current_path).to eq k_dorama_path(k_dorama2)
          expect(page).to have_content "感動した"
        end
      end
      context "投稿失敗",js: true do
        before do
          login(review.user)
          visit k_dorama_path(k_dorama2)
          click_on "レビューする"
        end
        it "項目に不備があれば投稿が失敗すること" do
          choose "see_all"
          fill_in '感想', with: '感動した。'
          fill_in 'review[recommendation]', with: 'ヒューマンドラマが好きな人'
          fill_in 'review[not_recommendation]', with: '暗い話が嫌いな人'
          click_on 'レビューする'
          expect(current_path).to eq reviews_path
          expect(page).to have_content "投稿に失敗しました"
        end
      end
    end
    describe "レビュー編集", js: true do
      context  "編集画面へのリンク" do
        before do
          login(review.user)
          visit k_dorama_path(review.k_dorama)
        end
        it "編集するを押すと自分のレビューの編集画面に遷移すること" do
          click_on "編集する"
          expect(current_path).to eq edit_review_path(review)
        end
      end
      context "編集" do
        before do
          login(review.user)
          visit k_dorama_path(review.k_dorama)
          click_on "編集する"
        end
        it "編集画面で編集した内容がレビュー内容に反映されていること" do
          fill_in '感想', with: 'めちゃくちゃ面白かった！'
          find('#star').find("img[alt='5']").click
          click_on "編集する"
          expect(page).to have_content "めちゃくちゃ面白かった！"
        end
        it "削除するを押すとレビューが削除されていること" do
          click_on "削除する"
          expect do
            expect(page.accept_confirm).to eq "本当に削除しますか？"
            expect(page).to have_content "コメントを削除しました。"
          end.to change(Review, :count).by(-1)
        end
      end
    end
  end
end
