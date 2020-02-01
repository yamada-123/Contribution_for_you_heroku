FactoryBot.define do
  factory :supply,class: Supply do
    title {'カタカナ'}
    content{'ア'}
    picture{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    user_id{'1'}
  end
  factory :second_supply,class: Supply do
    title {'カタカナ'}
    content {'イ'}
    picture{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    user_id {'1'}
  end
end
