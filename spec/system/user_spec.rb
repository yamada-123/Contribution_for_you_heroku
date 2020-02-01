require 'rails_helper'

RSpec.describe 'Users' , type: :system do
  describe '新規登録画面' do
    it '名前が空欄でエラーメッセージが出るテスト' do
      visit new_user_registration_path
      fill_in('user_name', with: '')
      fill_in('user_email',with: 'watanabe1@exaple.com')
      attach_file 'user_picture', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: 'foober')
      fill_in('user_password_confirmation',with: 'foober')
      click_on 'Sign up'
      expect(page).to have_content('名前を入力してください')
    end

    it 'emailが空欄でエラーメッセージがでるテスト' do
      visit new_user_registration_path
      fill_in('user_name', with: '渡辺')
      fill_in('user_email',with: '')
      attach_file 'user_picture', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: 'foober')
      fill_in('user_password_confirmation',with: 'foober')
      click_on 'Sign up'
      expect(page).to have_content('メールアドレスを入力してください')
      
    end
  
    it 'passwordが空欄でエラーメッセージが出るテスト' do
      visit new_user_registration_path
      fill_in('user_name',with: '渡辺')
      fill_in('user_email',with: 'watanabe1@exaple.com')
      attach_file 'user_picture', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: '')
      fill_in('user_password_confirmation',with: 'foober')
      click_on 'Sign up'
      expect(page).to have_content('パスワードを入力してください')
    end

    it 'password_confirmationが空欄でエラーメッセージが出るテスト' do
      visit new_user_registration_path
      fill_in('user_name',with: '渡辺')
      fill_in('user_email',with: 'watanabe1@example.com')
      attach_file 'user_picture', "#{Rails.root}/spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg"
      fill_in('user_password',with: 'foober')
      fill_in('user_password_confirmation',with: '')
      click_on 'Sign up'
      expect(page).to have_content('確認用パスワードとパスワードの入力が一致しません')
    end
  end


  describe 'ログインのテスト' do
    before do
      @user1 = FactoryBot.create(:first_user)
      @user2 = FactoryBot.create(:second_user)
    end
    it 'ログイン失敗時のメッセージテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'fail@example.com')
      fill_in('user_password',with: 'foober')
      click_on 'Log in'
      expect(page).to have_content('メールアドレス もしくはパスワードが不正です。')
    end
    it 'ログイン成功時のメッセージテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_on 'Log in'
      expect(page).to have_content('ログインしました')
    end
    it 'ログアウト時のメッセージテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_on 'Log in'
      click_on 'ログアウト'
      expect(page).to have_content('ログアウトしました')
    end
  end



  describe 'ユーザーの詳細、編集、更新のテスト' do
    before do
      @user1 = FactoryBot.create(:first_user)
      @user2 = FactoryBot.create(:second_user)
      # @demand1 = FactoryBot.create(:demand)
      # @demand2 = FactoryBot.create(:second_demand)
      # @supply1 = FactoryBot.create(:supply)
      # @supply2 = FactoryBot.create(:second_supply)
    end

    it 'ユーザー詳細画面に遷移するテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_on 'Log in'
      click_on 'ユーザー一覧画面'
      sleep 3
      tds = page.all('td')
      tds[4].click
      expect(page).to have_content('天野1')
    end

    it 'ユーザを編集するテスト' do
      visit new_user_session_path
      fill_in('user_email',with: 'amano1@example.com')
      fill_in('user_password',with: 'foober')
      click_on 'Log in'
      click_on 'ユーザー一覧画面'
      sleep 3
      tds = page.all('td')
      tds[5].click
      fill_in('user_name',with: 'しばおだよ')
      fill_in('user_current_password',with: 'foober')
      click_on 'Update'
      expect(page).to have_content('アカウント情報を変更しました。')
    end
  end

end
