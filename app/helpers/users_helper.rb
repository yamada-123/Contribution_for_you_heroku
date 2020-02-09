module UsersHelper
  def display_region(region)
    case region
    when 1 then
      p '北海道'
    when 2 then
      p '青森' 
    when 3 then
      p '岩手' 
    when 4 then
      p '宮城'
    when 5 then
      p '秋田'
    when 6 then
      p '山形'
    when 7 then
      p '福島'
    when 8 then
      p '茨城'
    when 9 then
      p '栃木'
    when 10 then
      p '群馬'
    when 11 then
      p '埼玉'
    when 12 then
      p '千葉'
    when 13 then
      p '東京'
    when 14 then
      p '神奈川'
    when 15 then
      p '新潟'
    when 16 then
      p '富山' 
    when 17 then
      p '石川'
    when 18 then
      p '福井'
    when 19 then
      p '山梨'
    when 20 then
      p '長野'
    when 21 then
      p '岐阜'
    when 22 then
      p '静岡'
    when 23 then
      p '愛知'
    when 24 then
      p '三重'
    when 25 then
      p '滋賀'
    when 26 then
      p '京都'
    when 27 then
      p '大阪'
    when 28 then
      p '兵庫'
    when 29 then
      p '奈良' 
    when 30 then
      p '和歌山'
    when 31 then
      p '鳥取'
    when 32 then
      p '島根'
    when 33 then
      p '岡山'
    when 34 then
      p '広島'
    when 35 then
      p '山口'
    when 36 then
      p '徳島'
    when 37 then
      p '香川'
    when 38 then
      p '愛媛'
    when 39 then
      p '高知'
    when 40 then
      p '福岡'
    when 41 then
      p '佐賀'
    when 42 then
      p '長崎'
    when 43 then
      p '熊本'
    when 44 then
      p '大分'
    when 45 then
      p '宮崎'
    when 46 then
      p '鹿児島'
    when 47 then
      p '沖縄'
    else
      p '未登録'
    end
  end
end