require 'rails_helper'
RSpec.describe KDorama, type: :system do
  let!(:k_dorama) { create(:k_dorama,) }
  let!(:k_dorama2) { create(:k_dorama, :k_dorama2) }
  describe 'トップページ' do
    context "キーワード検索" do
      it "検索欄にタイトルの一部が入っていれば関連するドラマが表示されること" do
        visit root_path
        fill_in 'キーワード検索', with: '梨泰院'
        click_on '検索'
        expect(current_path).to eq search_k_doramas_path
        expect(page).to have_content(k_dorama.title)
      end
      it "検索欄にジャンルの一部が入っていれば関連するドラマが表示されること" do
        visit root_path
        fill_in 'キーワード検索', with: '復'
        click_on '検索'
        expect(current_path).to eq search_k_doramas_path
        expect(page).to have_content(k_dorama.title)
      end
    end

    context "ジャンル" do
      it "感動系の画像リンクをクリックすると感動系に関連するドラマが表示されること" do
        visit root_path
        click_on '感動系'
        expect(current_path).to eq search_k_doramas_path
        expect(page).to have_content(k_dorama2.title)
      end

      it '感動系の画像リンクをクリックすると感動系ではないドラマは表示されないこと' do
        visit root_path
        click_on '感動系'
        expect(current_path).to eq search_k_doramas_path
        expect(page).to have_no_content(k_dorama.title)
      end
    end
  end
  describe 'searchページ' do
    it '関連するドラマの項目が正しく表示されていること' do
      visit root_path
      click_on '復讐系'
      expect(page).to have_content(k_dorama.title)
      expect(page).to have_content(k_dorama.introduction)
    end
  end

  describe '詳細ページ' do
    context 'ページ移動' do
      it '詳細をクリックしたらドラマの詳細ページへ移動できること' do
        visit root_path
        click_on '復讐系'
        click_on '詳細'
        expect(current_path).to eq k_dorama_path(k_dorama)
      end
      it 'ドラマの画像をクリックすると詳細ページへ移動すること' do
        visit root_path
        click_on '復讐系'
        find('.show_link').click
        expect(current_path).to eq k_dorama_path(k_dorama)
      end
    end
  end
end
