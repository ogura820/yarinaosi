require 'rails_helper'
describe 'ユーザー登録のテスト' do
  before do
  end
  context 'Sign up画面のフォームを埋めてCreate_my_accountを押した場合' do
    it 'ユーザーが新規登録できる' do
      visit new_user_path
      fill_in 'user[name]', with: 'test_name'
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'testtest'
      fill_in 'user[password_confirmation]', with: 'testtest'
      click_button 'Create my account'
      visit new_session_path
      sleep 1
      fill_in 'session[email]', with: 'test@gmail.com'
      fill_in 'session[password]', with: 'testtest'
      sleep 1
      click_button 'Log in'
      sleep 1
      expect(page).to have_content'test_name'
    end
  end
  context 'ログインせずタスク一覧に飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit tasks_path
      # expect(response).to redirect_to(new_session_path)
      expect(page).to have_current_path(new_session_path)
    end
  end
end