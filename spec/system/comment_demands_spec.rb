require 'rails_helper'

RSpec.describe 'CommentDemands' , type: :system do
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    visit new_user_session_path
    fill_in('user_email',with: 'amano1@example.com')
    fill_in('user_password',with: 'foober')
    click_button 'ログイン'
    @demand1 = FactoryBot.create(:first_demand,user_id: @user1.id)
    @demand2 = FactoryBot.create(:second_demand,user_id: @user2.id)
    @label1 = FactoryBot.create(:first_label)
    @label2 = FactoryBot.create(:second_label)
    @label3 = FactoryBot.create(:third_label)
    @label4 = FactoryBot.create(:forth_label)
    @labelling_demand1 = FactoryBot.create(:first_labelling_demand)
    @labelling_demand2 = FactoryBot.create(:second_labelling_demand)
  end

  it '投稿にコメントするテスト' do
    click_on '困り事'
    click_on '一覧'
    sleep 3
    page.all('a.btn.btn-primary')[0].click
    fill_in('comment_demand_content',with: 'コメントテスト')
    click_button 'コメント送信'
    expect(page).to have_content('コメントテスト')
  end

  it 'コメントを編集して更新するテスト' do
    click_on '困り事'
    click_on '一覧'
    sleep 3
    page.all('a.btn.btn-primary')[0].click
    fill_in('comment_demand_content',with: 'コメントテスト')
    click_button 'コメント送信'
    sleep 3
    click_on '編集'
    fill_in('comment_demand_content',with: 'コメント編集済')
    click_on '更新する'
    expect(page).to have_content('コメントを編集しました')
  end

  it 'コメントを削除するテスト' do
    click_on '困り事'
    click_on '一覧'
    sleep 3
    page.all('a.btn.btn-primary')[0].click
    fill_in('comment_demand_content',with: 'コメントテスト')
    click_button 'コメント送信'
    click_on '削除'
    expect(page).to have_content('コメントを削除しました')
  end
end