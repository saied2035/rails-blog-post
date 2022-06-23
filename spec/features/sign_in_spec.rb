require 'rails_helper'

RSpec.describe 'sign in', type: :feature do
	  before :each do
	  user = User.new(name: 'Saied', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
	  	bio: 'developer', email: 'saied2421998@gmail.com', password:'1234568')
	  user.confirm
	  user.save
	  end
	  it 'have email field' do
	  	  visit new_user_session_path
	  	  expect(page).to have_selector('input[type=email]')
	  end
	  it 'have password field' do
	  	  visit new_user_session_path
	  	  expect(page).to have_selector('input[type=password]')
	  end
	  it 'have submit button' do
	  	  visit new_user_session_path
	  	  expect(page).to have_selector('input[type=submit]')
	  end
	  it 'test blank data' do
	  	  visit new_user_session_path
	  	  test_case =  find('input[name=commit]')
	  	  test_case.click
	  	  expect(page.html).to include('Invalid Email or password.')
	  end
	  it 'test wrong email' do
	  	  visit new_user_session_path
	  	  fill_in 'Email', with: 'saied24298@gmail.com'
	  	  fill_in 'Password', with: '1234568'
	  	  test_case =  find('input[name=commit]')
	  	  test_case.click
	  	  expect(page.html).to include('Invalid Email or password.')
	  end
	  it 'test wrong password' do
	  	  visit new_user_session_path
	  	  fill_in 'Email', with: 'saied2421998@gmail.com'
	  	  fill_in 'Password', with: '1235'
	  	  test_case =  find('input[name=commit]')
	  	  test_case.click
	  	  expect(page.html).to include('Invalid Email or password.')
	  end
	  it 'provide right data' do
	  	  visit new_user_session_path
	  	  fill_in 'Email', with: 'saied2421998@gmail.com'
	  	  fill_in 'Password', with: '1234568'

	  	  click_button 'Log in'
	  	  expect(page).to have_current_path(root_path)
	  end		 
end	