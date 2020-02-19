require 'rails_helper'

RSpec.describe 'Users' , type: :system do
  
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
  end

  describe '新規登録画面' do
    it '名前が空欄でエラーメッセージが出るテスト' do
      visit new_user_registration_path
      fill_in('user_name', with: '')
      fill_in('user_email',with: 'watanabe1@exaple.com')
      attach_file 'user_img', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: 'foober')
      fill_in('user_password_confirmation',with: 'foober')
      click_button '新規登録'
      expect(page).to have_content('名前を入力してください')
    end

    it 'emailが空欄でエラーメッセージがでるテスト' do
      visit new_user_registration_path
      fill_in('user_name', with: '渡辺')
      fill_in('user_email',with: '')
      attach_file 'user_img', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: 'foober')
      fill_in('user_password_confirmation',with: 'foober')
      click_button '新規登録'
      expect(page).to have_content('メールアドレスを入力してください')
      
    end
  
    it 'passwordが空欄でエラーメッセージが出るテスト' do
      visit new_user_registration_path
      fill_in('user_name',with: '渡辺')
      fill_in('user_email',with: 'watanabe1@exaple.com')
      attach_file 'user_img', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: '')
      fill_in('user_password_confirmation',with: 'foober')
      click_button '新規登録'
      expect(page).to have_content('パスワードを入力してください')
    end

    it 'password_confirmationが空欄でエラーメッセージが出るテスト' do
      visit new_user_registration_path
      fill_in('user_name',with: '渡辺')
      fill_in('user_email',with: 'watanabe1@example.com')
      attach_file 'user_img', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: 'foober')
      fill_in('user_password_confirmation',with: '')
      click_button '新規登録'
      expect(page).to have_content('確認用パスワードとパスワードの入力が一致しません')
    end
  end


  describe 'ログイン、ログアウトのテスト' do

    it 'ログイン失敗時のメッセージテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'fail@example.com')
      fill_in('user_password',with: 'foober')
      click_button 'ログイン'
      expect(page).to have_content('メールアドレス もしくはパスワードが不正です。')
    end
    it 'ログイン成功時のメッセージテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_button 'ログイン'
      expect(page).to have_content('ログインしました')
    end
    it 'ログアウト時のメッセージテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_button 'ログイン'
      click_on 'ログアウト'
      expect(page).to have_content('ログアウトしました')
    end
  end



  describe 'ユーザーの詳細、編集、更新のテスト' do

    it 'ユーザー詳細画面に遷移するテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_button 'ログイン'
      # binding.pry
      click_on 'ユーザー'
      click_on '一覧'
      # binding.pry
      sleep 3
      # binding.pry
      page.all('a.btn.btn-primary')[0].click
      expect(page).to have_content('天野1')
    end
    it 'ユーザを編集するテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_button 'ログイン'
      click_on 'ユーザー'
      click_on '一覧'
      sleep 3
      page.all('a.btn.btn-success')[0].click
      fill_in('user_name',with: 'しばおだよ')
      select '北海道'
      click_button '更新'
      expect(page).to have_content('アカウント情報を変更しました。')
    end
  end

end
