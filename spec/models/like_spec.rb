require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Jerome', photo: 'https://unsplash.com/photos/XUdIi04ohps', bio: 'Student')
    @post = Post.create(author: @user, title: 'My post', text: 'Hello!')
  end

  it 'checks validity of like present' do
    @like = Like.create(author: @user, post: @post)
    expect(@like).to be_valid
  end

  it 'checks likes counter' do
    Like.create(author: @user, post: @post)
    expect(@post.likes_counter).to eq 1
  end
end
