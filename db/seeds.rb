unless Rails.env.test?
  10.times do
    user = FactoryGirl.create(:user, :admin)
    user.confirm
  end

  100.times do
    admin = FactoryGirl.create(:user)
    admin.confirm
  end
  
  post = Post.create(captions: "My first post!", user_id: User.first)
  post.tag_last.add('tags', 'more tags')
  
end
