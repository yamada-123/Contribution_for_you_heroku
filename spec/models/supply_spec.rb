require 'rails_helper'

RSpec.describe Supply, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'titleが空ならバリデーションが通らない' do
    demand = Demand.new(title: '',content: '失敗タイトル')
    expect(demand).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    demand = Demand.new(title:'失敗コンテント',content: '')
    expect(demand).not_to be_valid
  end
  it '両方入力されていれば通る' do
    demand = Demand.new(title: '成功',content:'失敗')
    expect(demand).to be_valid
  end
end
