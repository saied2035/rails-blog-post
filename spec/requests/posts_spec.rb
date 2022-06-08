require 'rails_helper'

describe "Posts", type: :request do
  before(:example) {get user_posts_path(user_id:15)}
  it "GET /index status" do
    expect(response).to have_http_status(200)
  end
  it "GET /index render template" do
    expect(response).to render_template(:index)
  end
  it "GET /index include correct placeholder" do
    expect(response.body).to include('Here is a list of posts for a user')
  end

describe "Post", type: :request do
  before(:example) {get user_post_path({id:12})}
    it "GET /show status" do
      expect(response).to have_http_status(200)
    end
    it "GET /show render template" do
      expect(response).to render_template(:show)
    end
    it "GET /show include correct placeholder" do
      expect(response.body).to include('Here are information about specific post')
    end           
end

end

