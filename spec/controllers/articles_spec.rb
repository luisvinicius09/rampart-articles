require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  it 'tests the GET /all' do
    get '/all'
    expect(response).to have_http_status(302)
  end
end
