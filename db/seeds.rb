# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |user|
  name = Faker::Name.unique.name
  email = Faker::Internet.email
  password = "foober"

  User.create!(name: name,
                email: email,
                password: "foober",
                password_confirmation: "foober",
                )
  end

# 管理者の作成
  User.create!(name: "admin",
              email: "admin1@example.com",
              password: "foober",
              password_confirmation: "foober",
              admin: true
              )

  Label.create!(category: "暮らし"
              )

  

  
  20.times do |demand|
    content = Faker::Dessert.variety
    Demand.create!(title: "フルーツ名",
      content: content,
      user_id: User.first.id              
    )
  end
  
  20.times do |supply|
    content = Faker::Dessert.variety          
    Supply.create!(title: "フルーツ名",
      content: content,
      user_id: User.first.id        
    )
  end
  

   Demand.all.each do  |demand|
      demand.id 
  LabellingDemand.create!(demand_id: demand.id,
                         label_id: Label.first.id
                         )
   end

   Supply.all.each do |supply|
      supply.id
   LabellingSupply.create!(supply_id: supply.id,
                          label_id: Label.first.id
                          )
  end