require 'rails_helper'

describe 'Users', type: :request do
  before(:example) { get users_path }
  it 'GET /index status' do
    expect(response).to have_http_status(200)
  end
  it 'GET /index render template' do
    expect(response).to render_template(:index)
  end
  it 'GET /index include correct placeholder' do
    expect(response.body).to include('Here is a list of users')
  end

  describe 'User', type: :request do
    before(:example) { get user_path({ id: 12 }) }
    it 'GET /show status' do
      expect(response).to have_http_status(200)
    end
    it 'GET /show render template' do
      expect(response).to render_template(:show)
    end
    it 'GET /show include correct placeholder' do
      expect(response.body).to include('Here are information about specific user')
    end
  end
end
