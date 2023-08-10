module ControllerMacros
  def login(user)
    #ログインページに遷移
    visit new_user_session_path
    #入力フォームに情報を入力
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
end
