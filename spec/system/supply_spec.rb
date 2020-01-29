require 'rails_helper'

RSpec.describe 'スキル投稿管理機能', type: :system do
  
  describe 'スキル一覧画面' do
    context 'スキル投稿をした場合' do
      it '投稿済みのスキルが表示されること' do
      @supply = FactoryBot.create(:supply)
      visit supplies_path
      expect(page).to have_content 'カタカナ'
      end
    end
  end

end