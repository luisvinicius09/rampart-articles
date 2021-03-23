require 'rails_helper'

RSpec.describe "Articles", type: :request do
  it 'tests the GET /business' do
    get '/business'
    expect(response).to have_http_status(200)
  end
  it 'tests the GET /sports' do
    get '/sports'
    expect(response).to have_http_status(200)
  end
  it 'tests the GET /fashion' do
    get '/fashion'
    expect(response).to have_http_status(200)
  end
  it 'tests the GET /entertainment' do
    get '/entertainment'
    expect(response).to have_http_status(200)
  end
end