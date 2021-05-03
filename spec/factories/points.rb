FactoryBot.define do
  factory :point do
    id { 1 }
    sender { 'hoge' }
    receiver { 'huga' }
    mindtype { 'INSIGHT' }
    comment { 'comment' }
    reply { 'reply' }
    likes { 0 }
  end
end