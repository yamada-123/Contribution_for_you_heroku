require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = FactoryBot.create(:first_user)
  end
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'nameが空ならバリデーションが通らない' do
    user = User.new(name: '', email: 'test1@exaple.com',)
    expect(user).not_to be_valid
  end

  it 'emailが空ならバリデーションが通らない' do
    user = User.new(name: 'テスト1',email: '')
    expect(user).not_to be_valid
  end

  it 'passwordが空ならバリデーションが通らない' do
    user = User.new(name: 'テスト1',email: 'test1@exaple.com',password: '')
    expect(user).not_to be_valid
  end

  it 'name,email,passwordが記載されていればバリデーションが通る' do
    user = User.new(name: 'テスト1',email: 'test1@example.com',password: 'foober')
    expect(user).to be_valid
  end

  it 'nameが31文字以上ならバリデーションが通らない' do
    user = User.new(name: 'a'*36,email: 'test1@example.com',password: 'foober')
    expect(user).not_to be_valid
  end

  it 'emailの形式が違ったらバリデーションが通らない' do
    user = User.new(name: 'テスト1',email: 'test1',password: 'foober')
    expect(user).not_to be_valid
  end

  it 'emailが大文字でもバリデーションが通る' do
    user = User.new(name: 'テスト1',email: 'TEST1@example.com',password: 'foober')
    expect(user).to be_valid
  end

  it 'emailがすでに登録されている場合バリデーションが通らない' do
    user = User.new(name: 'テスト1',email: 'amano1@example.com',password: 'foober')
    expect(user).not_to be_valid
  end

  it 'introductionが301文字以上ならバリデーションが通らない' do
    user = User.new(name: 'テスト1',email: 'amano2@example.com',password: 'foober',introduction: 'a'*301)
    expect(user).not_to be_valid
  end
end
