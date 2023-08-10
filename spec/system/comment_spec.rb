require 'rails_helper'

RSpec.describe Comment, type: :system do
  let!(:comment) { create(:comment) }
  let!(:comment_user) { comment.user }
  let!(:review) { comment.review }
  let!(:reply_user) { review.user }
  let(:reply) { create(:comment, :reply, parent_id: comment.id, user:reply_user, review:review )}
  describe 'レビューに対するコメントのリンク' do
    context "レビューの名前をクリックした時" do
      before do
        visit k_dorama_path(review.k_dorama)
      end
      it "レビューに対するコメントページに遷移すること" do
        click_on review.user.name
        expect(current_path).to eq review_path(review)
      end
    end
    context "返信アイコンをクリックした時" do
      before do
        visit k_dorama_path(review.k_dorama)
      end
      it "レビューに対するコメントページに遷移すること" do
        find('.review_comments').click
        expect(current_path).to eq review_path(review)
      end
    end
  end
  describe 'コメントの項目', js: true do
    before do
      visit review_path(review)
    end
    it 'レビューに対するコメントが表示されていること' do
      expect(page).to have_content(comment.comment)
    end
    it 'コメントのユーザー名が表示されること' do
      expect(page).to have_content "田中"
    end
    it 'コメントの作成時間が表示されること' do
      expect(page).to have_content(comment.created_at)
    end
  end
  describe 'コメントの投稿', js: true do
    before do
      login(comment_user)
      visit review_path(review)
    end
    it 'コメントの投稿ができること' do
      fill_in 'comment[comment]', with: '最初から面白かったですか？'
      click_on 'コメントする'
      expect(page).to have_content 'コメントの投稿に成功しました'
      expect(page).to have_content '最初から面白かったですか？'
    end
  end
  describe 'コメントの削除', js: true do
    before do
      login(comment_user)
      visit review_path(review)
    end
    it "削除するを押すとコメントの削除ができること" do
      within('.destroy_btn') do
        click_on "削除する"
      end
      expect(page).to have_content "コメントの削除に成功しました。"
      expect(page).to have_no_content comment.comment
    end
  end
  describe 'コメントの返信', js: true do
    context '返信の投稿ができること' do
      before do
        login(review.user)
        visit review_path(review)
      end
      it 'コメントの返信アイコンを押すと返信のフォームが表示されること' do
        find('.reply_btn').click
        fill_in "reply_#{comment.id}_input", with: '最初から面白かったです！'
        click_on "返信する"
        find('.reply_btn').click
        expect(page).to have_content '最初から面白かったです！'
      end
    end
    context 'コメントの返信の削除' do
      before do
        login(reply.user)
        visit review_path(review)
      end
      it '削除するを押すとコメントの返信を削除できること' do
        find('.reply_btn').click
        within('#reply_destroy') do
          click_on "削除する"
        end
        expect(page).to have_content "コメントの削除に成功しました。"
        find('.reply_btn').click
        expect(page).to have_no_content "段々這い上がっていくところが面白かったです！"
        page.save_screenshot
      end
    end
  end
end
