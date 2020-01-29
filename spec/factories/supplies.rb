FactoryBot.define do
  factory :supply do
    title {'カタカナ'}
    content{'ア'}
    picture{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
  end
end
