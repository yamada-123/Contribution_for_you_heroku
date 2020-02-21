require 'rails_helper'

RSpec.describe Demand, type: :model do
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
  end
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'titleが空ならバリデーションが通らない' do
    demand = Demand.new(title:'' ,content: '失敗タイトル',user_id:@user1.id)
    expect(demand).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    demand = Demand.new(title:'失敗コンテント',content: '',user_id:@user1.id)
    expect(demand).not_to be_valid
  end
  it 'titleとcontentが両方入力されていたら通る' do
    demand = Demand.new(title: '成功',content: '成功',user_id:@user1.id )
    #binding.pry
    expect(demand).to be_valid
  end
end
