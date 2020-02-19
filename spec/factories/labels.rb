    FactoryBot.define do

      factory :first_label,class: Label do
        category { "暮らし" }
      end
    
      factory :second_label,class: Label do
        category { "趣味" }
      end
    
      factory :third_label,class: Label do
        category { "学問" }
      end

      factory :forth_label,class: Label do
        category {"仕事"}
      end

    end

