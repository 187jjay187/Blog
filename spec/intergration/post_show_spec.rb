require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @user = User.create(
      name: 'Maurice Moss',
      photo: 'https://ents24.imgix.net/image/000/136/278/37e32509179745395779aa42d9709a8aa8028d11.jpg?auto=format&crop=faces&w=1920&h=1920',
      bio: 'Sales representative'
    )
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post!')
    Comment.create(post: @post, author: @user, text: 'Happy to comment!')
    Comment.create(post: @post, author: @user, text: 'Today is a good day!')
    visit user_posts_path(@user.id)
  end

  it 'should have the post title' do
    expect(page).to have_content(@post.title)
  end

  it 'should have the writer of the post' do
    expect(page).to have_content("#{@user.name}:")
  end

  it 'should have the number of comments for the post' do
    expect(page).to have_content('Comments: 2')
  end

  it 'should have the number of likes for the post' do
    expect(page).to have_content('Likes: 0')
  end

  it 'should have the body of the post' do
    expect(page).to have_content('This is my first post!')
  end

  it 'should have the username of each commentor' do
    expect(page).to have_content(@user.name)
  end

  it 'should have the comment of each commentor' do
    expect(page).to have_content('Happy to comment!')
  end
end
