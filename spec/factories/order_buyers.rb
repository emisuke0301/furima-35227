FactoryBot.define do
  factory :order_buyer do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '札幌市中央区' }
    block         { '旭ヶ丘1-1-1' }
    building      { '旭ビル2F' }
    phone_num     { '09012345678' }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end