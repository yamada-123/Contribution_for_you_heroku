require 'rails_helper'

RSpec.describe 'スキル管理機能',type: :system do
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    visit new_user_session_path
    fill_in('user_email', with: @user1.email)
    fill_in('user_password', with: @user1.password)
    click_button 'ログイン' #user一覧画面へ
    @supply1 = FactoryBot.create(:first_supply,user_id: @user1.id)
    @supply2 = FactoryBot.create(:second_supply,user_id: @user2.id)
    @label1 = FactoryBot.create(:first_label)
    @label2 = FactoryBot.create(:second_label)
    @label3 = FactoryBot.create(:third_label)
    @label4 = FactoryBot.create(:forth_label)
    @labelling_supply1 = FactoryBot.create(:first_labelling_supply)
    @labelling_supply2 = FactoryBot.create(:second_labelling_supply)
  end

  describe 'スキル関連' do  #テスト対象

    it "作成済みのスキルが表示されること" do#何を確認するか
      visit supplies_path
      expect(page).to have_content  "テスト1"
    end

    it "タイトルと内容が空欄で投稿失敗するテスト" do
      click_on "スキル"
      click_on "投稿"
      fill_in('supply_title',with:"")
      fill_in('supply_content',with:"")
      click_on '投稿'
      expect(page).to have_content('タイトルを入力してください')
      expect(page).to have_content('内容を入力してください')       
    end

    it "投稿詳細画面に遷移するテスト" do
      click_on "スキル"
      click_on "一覧"
      sleep 3
      page.all('a.btn.btn-primary')[0].click
      expect(page).to have_content('テスト1')
    end

    it "投稿を編集するテスト" do
      click_on "スキル"
      click_on "一覧"
      sleep 3
      page.all('a.btn.btn-success')[0].click
      #binding.pry
      fill_in('supply_title',with:"編集済み")
      fill_in('supply_content',with:"編集済み")
      page.find("#supply_label_ids_#{@label4.id}").click
      click_on "投稿"
      expect(page).to have_content('編集済み')
      #binding.pry
    end

    it "投稿を削除するテスト" do
      click_on "スキル"
      click_on "一覧"
      sleep 3
      page.all('a.btn.btn-danger')[1].click
      expect(page).to have_content('スキル投稿を削除しました')
    end

    it "タイトルで検索するテスト" do
      click_on "スキル"
      click_on "一覧"
      fill_in('q_title_cont',with:"テスト1")
      click_on "検索"
      expect(page).not_to have_content("テスト2")
    end

    it "ユーザー名で検索するテスト" do
      click_on "スキル"
      click_on "一覧"
      fill_in('q_user_name_cont',with:"天野1")
      click_on "検索"
      expect(page).to have_content("天野1")
    end

    it "カデゴリで検索するテスト" do
      click_on "スキル"
      click_on "一覧"
      page.find("#q_labels_id_eq_any_#{@label1.id}").click
      click_on "検索"
      expect(page).to have_content("テスト1")
    end



  end
end