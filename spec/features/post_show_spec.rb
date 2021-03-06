require 'rails_helper'

RSpec.describe 'posts#show', type: :feature do
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
    @post1 = Post.create(author: @user1, title: 'I get bored', text: 'can someone else compete this ?')
    Post.create(author: @user1, title: 'I get bored', text: 'can someone else compete this ?')
    Post.create(author: @user1, title: 'I get bored', text: 'can someone else compete this ?')
    Post.create(author: @user1, title: 'I get bored', text: 'can someone else compete this ?')
    Post.create(author: @user1, title: 'I get bored', text: 'can someone else compete this ?')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    Comment.create(author: @user1, post: @post1, text: 'comment here!')
    visit user_post_path(user_id: @user1.id, id: @user1.posts.first.id)
  end
  it 'username of the user' do
    expect(page).to have_content @user1.name
  end
  it 'see post title' do
    expect(find('.title')).to have_content @post1.title
  end
  it 'see comments and likes counter of the post' do
    expect(find('.comments-likes-counter')).to have_content 'Comments'
    expect(find('.comments-likes-counter')).to have_content 'Likes'
  end
  it 'see post text' do
    expect(find('.topic')).to have_content @post1.text
  end
  it 'see post title' do
    expect(find('.title')).to have_content @post1.title
  end
  it 'see post comments with their commentators' do
    expect(find_all('.comment')[0]).to have_content @user1.name
  end
end
