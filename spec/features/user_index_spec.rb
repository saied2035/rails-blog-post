require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
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
    visit users_path
  end

  it 'username of the other users' do
    expect(page).to have_content 'Saied1'
    expect(page).to have_content 'Saied2'
  end
  it 'see number of posts counter of all users' do
    # the user can see all posts counter for the users included him/her self
    expect(find_all('.post-num').count).to eq(3)
  end

  it 'see number of images of all users' do
    # the user can see all images for the users included him/her self
    expect(find_all('img').count).to eq(3)
  end

  it 'access saied1 profile page' do
    find(:css, "a[href='/users/#{@user1.id}']").click
    expect(page).to have_current_path(user_path(id: @user1.id))
    expect(page).to have_content @user1.name
  end

  it 'access saied2 profile page' do
    find(:css, "a[href='/users/#{@user2.id}']").click
    expect(page).to have_current_path(user_path(id: @user2.id))
    expect(page).to have_content @user2.name
  end  
end
