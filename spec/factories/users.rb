FactoryBot.define do
  factory :first_user, class: User do
    name {'天野1'}
    email {'amano1@example.com'}
    password {'foober'}
    password_confirmation {'foober'}
    picture{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    introduction {'はじめまして1'}
    region {'日本1'}
    #confirmed_at { Date.today }
    admin {'true'}
  end
  factory :second_user, class: User do
    name {'天野2'}
    email {'amano2@example.com'}
    password {'foober'}
    password_confirmation {'foober'}
    picture{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/PPP_sanpocyunopomeranian_TP_V.jpg'))}
    introduction {'はじめまして2'}
    region {'日本2'}
    #confirmed_at { Date.today }
    admin {'false'}
  end
end
