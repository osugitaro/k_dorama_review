require 'rails_helper'
RSpec.describe KDorama, type: :system do
  let!(:k_dorama) { create(:k_dorama,) }
  let!(:k_dorama2) { create(:k_dorama, :k_dorama2) }
  let!(:k_dorama3) { create(:k_dorama, title: 'test1', cast: "cast1", rate_average: 5.0) }
  let!(:k_dorama4) { create(:k_dorama, title: 'test2', cast: "cast2", rate_average: 3.0) }
  let(:card_body) { page.all(".card-body") }
  describe 'トップページ' do
    context "タイトルで検索" do
      before do
        visit root_path
        fill_in 'タイトルで検索', with: '梨泰院'
        click_on '検索'
      end

      it "タイトル検索欄にタイトルの一部が入っていれば関連するドラマが表示されること" do
        expect(current_path).to eq search_k_doramas_path
        expect(page).to have_content(k_dorama.title)
      end

      it "関連のないドラマは表示されないこと" do
        expect(page).to have_no_content(k_dorama2.title)
        expect(page).to have_no_content(k_dorama3.title)
        expect(page).to have_no_content(k_dorama4.title)
      end
    end

    context "キャストで検索" do
      before do
        visit root_path
        fill_in 'キャストで検索', with: 'パク'
        click_on '検索'
      end
      it "キャスト検索欄にキャストの一部が入っていれば関連するドラマが表示されること" do
        expect(current_path).to eq search_k_doramas_path
        expect(page).to have_content(k_dorama.title)
      end

      it "関連のないドラマは表示されないこと" do
        expect(page).to have_no_content(k_dorama2.title)
        expect(page).to have_no_content(k_dorama3.title)
        expect(page).to have_no_content(k_dorama4.title)
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
    context 'searchページ遷移時' do
      before do
        visit root_path
        click_on '復讐系'
      end
      it '関連するドラマの項目が正しく表示されていること' do
        expect(page).to have_content(k_dorama.title)
        expect(page).to have_content(k_dorama.introduction)
      end

      it '評価順に並んでいること' do
        expect( card_body[0].find('h5').text ).to eq "test1"
        expect( card_body[1].find('h5').text ).to eq "梨泰院クラス"
        expect( card_body[2].find('h5').text ).to eq "test2"
      end
    end

    context '星5のドラマを押した時',  js: true do
      before do
        visit root_path
        click_on '復讐系'
        sleep 1.0
        find('#rate5-tab').click
      end
      it '星5のドラマが表示されていること' do
        expect(page).to have_selector('.active', text: k_dorama3.title)
      end

      it '星5以外のドラマは表示されていないこと' do
        expect(page).to have_no_content(k_dorama4.title)
        expect(page).to have_no_content(k_dorama.title)
      end
    end

    context '星4以上のドラマを押した時', js: true do
      before do
        visit root_path
        click_on '復讐系'
        sleep 1.0
        find('#taller-than4-tab').click
      end
      it '星4以上のドラマが表示されていること' do
        expect(page).to have_selector('.active', text: k_dorama.title)
        expect(page).to have_selector('.active', text: k_dorama3.title)
      end

      it '星4より下のドラマは表示されないこと' do
        expect(page).to have_no_content(k_dorama4.title)
      end
    end
  end

  describe '詳細ページ' do
    context 'ページ移動' do
      it '詳細をクリックしたらドラマの詳細ページへ移動できること' do
        visit root_path
        click_on '復讐系'
        find_by_id('show_' + k_dorama.title).click
        expect(current_path).to eq k_dorama_path(k_dorama)
      end
      it 'ドラマの画像をクリックすると詳細ページへ移動すること' do
        visit root_path
        click_on '復讐系'
        find_by_id('img_' + k_dorama.title).click
        expect(current_path).to eq k_dorama_path(k_dorama)
      end
    end
  end
end
