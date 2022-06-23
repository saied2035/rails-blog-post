require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
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
    post1 = Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Post.create(author:@user1,title:'I get bored', text: 'can someone else compete this ?')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    Comment.create(author:@user1,post:post1,text: 'comment here!')
    visit user_posts_path(user_id:@user1.id)
  end
  it 'see user image' do
    expect(find_all('img').count).to eq(1)
  end
  it 'username of the user' do
    expect(page).to have_content @user1.name
  end
  it 'see number of posts counter of  the user' do
    expect(find_all('.post-num').count).to eq(1)
  end
   it 'see posts titles of the user' do
    expect(find_all('.title').count).to eq(5)
   end
   it 'see part of the posts text' do
    expect(find_all('.topic').count).to eq(5)
   end
   it 'see five recent comments of the posts' do
    expect(find_all('.single-comment').count).to eq(5)
   end
   it 'see comments and likes counter of the post' do
    expect(find_all('.comments-likes-counter')[0]).to have_content 'Comments'
    expect(find_all('.comments-likes-counter')[0]).to have_content 'Likes'
   end
   it 'see  pagination button' do
    expect(find('#show-posts')).to have_content 'pagination'
   end
  it 'access specific post for the user' do
    find(:css, "a[href='/users/#{@user1.id}/posts/#{@user1.posts.first.id}']").click
    expect(page).to have_current_path(user_post_path(user_id: @user1.id, id: @user1.posts.first.id))
  end          
end
