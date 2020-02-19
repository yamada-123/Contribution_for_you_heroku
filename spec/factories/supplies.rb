FactoryBot.define do

  factory :first_supply,class: Supply do
    title { 'テスト1'}
    content { 'テスト1' }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
  end

  factory :second_supply,class: Supply do
    title {'テスト2'}
    content {'テスト2'}
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
  end

end