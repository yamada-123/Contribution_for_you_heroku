require 'rails_helper'

RSpec.describe 'Users' , type: :system do
  
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    visit new_user_session_path
    fill_in('user_email',with: 'amano1@example.com')
    fill_in('user_password',with: 'foober')
    click_button 'ログイン'
  end

  it 'メッセージを相手に送信できるテスト' do
    click_on 'メッセージ'
    fill_in('message_body',with: 'メッセージテスト')
    click_on '送信'
    expect(page).to have_content('メッセージテスト')
  end

  it '自分のメッセージを削除できるテスト' do
    click_on 'メッセージ'
    fill_in('message_body',with: 'メッセージテスト')
    click_on '送信'
    click_on '削除'
    expect(page).not_to have_content('メッセージテスト')
  end
end