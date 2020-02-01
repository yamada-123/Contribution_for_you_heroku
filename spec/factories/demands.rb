FactoryBot.define do
  factory :demand,class: Demand do
    title { 'ひらがな'}
    content { 'あ' }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    user_id {'1'}
  end
  factory :second_demand,class: Demand do
    title {'ひらがな'}
    content {'い'}
    picture {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    user_id {'1'}
  end
end