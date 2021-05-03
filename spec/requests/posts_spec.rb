require 'rails_helper'

describe 'PointAPI' do
  it '全てのポイントを取得する' do
    FactoryBot.create_list(:point, 1)

    get '/api/v1/points'
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

    # 正しい数のデータが返されたか確認する。
    expect(json.length).to eq(1)
  end

  it '特定のポイントを取得する' do
    post = FactoryBot.create(:point, sender: 'test-sender')

    get "/api/v1/points/#{post.id}"
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

    # 正しい数のデータが返されたか確認する。
    expect(json['sender']).to eq(post.sender)
  end
end