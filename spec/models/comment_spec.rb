require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Jerome', photo: 'https://unsplash.com/photos/XUdIi04ohps', bio: 'Student')
    @post = Post.create(author: @user, title: 'My post', text: 'Hello!')
    @comment = Comment.create(post: @post, author: @user, text: 'Hi Jay!')
  end

  it 'user attribute should be valid' do
    expect(@user).to be_valid
  end

  it 'post attribute should be valid' do
    expect(@post).to be_valid
  end

  it 'comment should be valid' do
    expect(@comment).to be_valid
  end

  it 'update_post_comments_counter should increse comments' do
    expect(@post.comments_counter).to eq 1
  end
end
