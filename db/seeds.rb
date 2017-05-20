unless Rails.env.test?
  %w(info help).each do |email|
    User.create(
      admin: true,
      email: "#{email}@doublehranch.com",
      password: 'test-admin-accounts'
    )
  end

  10.times do
    user = FactoryGirl.create(:user, :admin)
    user.confirm
  end

  100.times do
    admin = FactoryGirl.create(:user)
    admin.confirm
  end

  post = Post.create(caption: "My first post!", user_id: User.first)
  post.tag_list.add('tags', 'more tags')
end
