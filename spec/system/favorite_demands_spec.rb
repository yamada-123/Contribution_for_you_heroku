require 'rails_helper'

RSpec.describe '困りごとお気に入り管理機能',type: :system do
  
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    visit new_user_session_path
    fill_in('user_email', with: @user1.email)
    fill_in('user_password', with: @user1.password)
    click_button 'ログイン' #user一覧画面へ
    #@demand1 = FactoryBot.create(:first_demand,user_id: @user1.id)
    @demand2 = FactoryBot.create(:second_demand,user_id: @user2.id)
    @label1 = FactoryBot.create(:first_label)
    @label2 = FactoryBot.create(:second_label)
    @label3 = FactoryBot.create(:third_label)
    @label4 = FactoryBot.create(:forth_label)
    @labelling_demand1 = FactoryBot.create(:first_labelling_demand)
    @labelling_demand2 = FactoryBot.create(:second_labelling_demand)
  end

  it '投稿をお気に入りするテスト' do
    visit demands_path
    click_on '詳細'
    click_on 'お気に入りする'
    expect(page).to have_content('天野2さんの困りごと投稿をお気に入り登録しました')
  end

  it '投稿をお気に入り解除するテスト' do
    visit demands_path
    click_on '詳細'
    click_on 'お気に入りする'
    click_on '詳細'
    click_on 'お気に入り解除'
    expect(page).to have_content('天野2さんの困りごと投稿をお気に入り解除しました。')
  end

end