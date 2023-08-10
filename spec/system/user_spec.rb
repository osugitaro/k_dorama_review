require 'rails_helper'
RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  describe 'ユーザー新規登録' do
    context 'フォームの値が正常な時' do
      it 'ユーザーの新規作成が成功 ' do
        visit new_user_registration_path
        fill_in 'name', with: 'kotaro'
        fill_in 'email', with: 'sugi@gmail.com'
        fill_in 'password', with: 'sugi1234'
        click_button '登録'
        expect(current_path).to eq user_path(User.first.id)
        expect(page).to have_content("アカウント登録が完了しました。")
      end
    end

    context 'nameが未記入の時' do
      it 'ユーザーの新規登録が失敗' do
        visit new_user_registration_path
        fill_in 'name', with: nil
        fill_in 'email', with: 'sugi@gmail.com'
        fill_in 'password', with: 'sugi1234'
        click_button '登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content("名前を入力してください")
      end
    end

    context 'emailが未記入の時' do
      it 'ユーザーの新規登録が失敗' do
        visit new_user_registration_path
        fill_in 'name', with: 'kotaro'
        fill_in 'email', with: nil
        fill_in 'password', with: 'sugi1234'
        click_button '登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content("メールアドレスを入力してください")
      end
    end

    context 'emailが~@~の形で入力されていないとき' do
      it 'ユーザーの新規登録が失敗' do
        visit new_user_registration_path
        fill_in 'name', with: 'kotaro'
        fill_in 'email', with: 'sugitaro'
        fill_in 'password', with: 'sugi1234'
        click_button '登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content("メールアドレスは不正な値です")
      end
    end

    context 'passwordが6文字未満のとき' do
      it 'ユーザーの新規登録が失敗' do
        visit new_user_registration_path
        fill_in 'name', with: 'kotaro'
        fill_in 'email', with: 'sugi@gmail.com'
        fill_in 'password', with: 'sugi'
        click_button '登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content("パスワードは半角英数字6文字以上で入力してください")
      end
    end

    context 'passwordが半角英数字ではないとき' do
      it 'ユーザーの新規登録が失敗' do
        visit new_user_registration_path
        fill_in 'name', with: 'kotaro'
        fill_in 'email', with: 'sugi@gmail.com'
        fill_in 'password', with: "すぎ1234"
        click_button '登録'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content("パスワードは半角英数字6文字以上で入力してください")
      end
    end
  end
  describe '編集' do
    context 'ログインしていない時' do
      it '編集画面に行こうとしてもログイン画面に遷移する' do
        visit edit_user_registration_path
        expect(current_path).to eq new_user_session_path
      end
    end

    context 'ログインしていて、編集画面で正常な値が入力されている時' do
      before do
        login(user)
      end

      it '編集が成功' do
        visit edit_user_registration_path
        fill_in 'name', with: 'sugitaro'
        fill_in 'current_password', with: 'kotaro1234'
        click_button '更新'
        expect(current_path).to eq user_path(user)
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
    end

    context 'ログインしていて、現在のパスワードが入力されていない時' do
      before do
        login(user)
      end
      it '編集が失敗' do
        visit edit_user_registration_path
        fill_in 'name', with: 'sugitaro'
        click_button '更新'
        expect(current_path).to eq user_registration_path
        expect(page).to have_content '現在のパスワードを入力してください'
      end
    end
  end
end
