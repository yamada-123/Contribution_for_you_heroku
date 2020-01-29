FactoryBot.define do
  factory :demand do
    title { 'ひらがな'}
    content { 'あ' }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    #picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'), 'image/jpeg')}
    # factory :demand do
    #   avatar  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    # end
  end
end