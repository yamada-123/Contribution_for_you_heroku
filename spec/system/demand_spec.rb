require 'rails_helper'

RSpec.describe '困りごと管理機能',type: :system do

  describe '困りごと一覧画面' do  #テスト対象
    context '困りごとを作成した場合' do  #テスト時の条件
      it "作成済みの困りごとが表示されること" do#何を確認するか
        @demand = FactoryBot.create(:demand) #画像は格納されている
        
      visit demands_path
        #binding.pry

         expect(page).to have_content  "ひらがな"
         expect(page).to have_content  "あ"
      end
    end
  end

end