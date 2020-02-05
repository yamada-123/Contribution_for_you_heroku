require 'rails_helper'

RSpec.describe Supply, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'titleが空ならバリデーションが通らない' do
    supply = Supply.new(title: '',content: '失敗タイトル')
    expect(supply).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    supply = Supply.new(title:'失敗コンテント',content: '')
    expect(supply).not_to be_valid
  end
  it '両方入力されていれば通る' do
    supply = Supply.new(title: '成功',content:'失敗')
    #binding.pry
    expect(supply).to be_valid
  end
end
