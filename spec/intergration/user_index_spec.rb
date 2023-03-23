require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Tom',
      photo: 'https://cdn-icons-png.flaticon.com/512/4140/4140048.png',
      bio: 'Artist',
      posts_counter: 3
    )
    @user2 = User.create(
      name: 'Jay',
      photo: 'https://cdn-icons-png.flaticon.com/512/9461/9461667.png',
      bio: 'Engineer',
      posts_counter: 0
    )
    visit root_path
  end

  it 'should have the username of all users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'should have the photo of each user' do
    expect(page).to have_selector('div')
    expect(page).to have_selector('div')
  end

  it 'should have the users number of posts' do
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Number of posts: 0')
  end

  it 'should redirect to that users show page on click' do
    visit(user_path(@user1.id))
    expect(page).to have_content(@user1.bio)
  end
end
