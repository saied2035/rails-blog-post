require 'rails_helper'

RSpec.describe 'users#show', type: :feature do

  before :each do
    user = User.new(name: 'Saied', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                    bio: 'developer', email: 'saied3@gmail.com', password: '123456789')
    user.confirm
    user.save
    login_as(user)
  end

  before :each do
    @user1 = User.new(name: 'Saied1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                      bio: 'developer', email: 'saied1@gmail.com', password: '123456')
    @user1.confirm
    @user1.save
    @user2 = User.new(name: 'Saied2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                      bio: 'developer', email: 'saied2@gmail.com', password: '12345678')
    @user2.confirm
    @user2.save
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    visit user_path(id:@user1.id)
  end

  it 'username of the user' do
    expect(page).to have_content @user1.name
  end
  it 'see number of posts counter of the user' do
    expect(find_all('.post-num').count).to eq(1)
  end

  it 'see user image' do
    expect(find_all('img').count).to eq(1)
  end

  it 'see user bio'  do
    expect(page).to have_content @user1.bio
  end

  it 'see user all posts buton'  do
    expect(find('#show-posts')).to have_content 'See all posts'
  end

  it 'see user recent three posts'  do   
    expect(find_all('.post-info').count).to eq(3)
  end
  it 'access specific post for the user' do
    find(:css, "a[href='/users/#{@user1.id}/posts/#{@user1.recent_posts.first.id}']").click
    expect(page).to have_current_path(user_post_path(user_id: @user1.id, id: @user1.recent_posts.first.id))
  end
  it 'access all posts of the user' do
    find(:css, "a[href='/users/#{@user1.id}/posts']").click
    expect(page).to have_current_path(user_posts_path(user_id: @user1.id))
  end  
end
