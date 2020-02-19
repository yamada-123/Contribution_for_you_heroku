FactoryBot.define do

  factory :first_demand,class: Demand do
    title { 'テスト1'}
    content { 'テスト1' }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    #label_ids {['1']}
    #user_id {68}
  end

  factory :second_demand,class: Demand do
    title {'テスト2'}
    content {'テスト2'}
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    #label_ids {['1']}
    #user_id {69}
  end

end