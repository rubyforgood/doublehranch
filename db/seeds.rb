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

  position_names = ["Staff Member", "Camper", "Counselor", "Volunteer"]
  position_types = ["ALCOA", "Activities Coordinator", "Aquatics Director", "Archery", "Arts & Crafts", "Arts & Crafts Assistant", "Arts & Crafts Director", "Barn", "Barn Director", "Barn Manager", "Barn Staff", "CIT", "CIT/LIT Associate", "Counselor", "Creative Arts", "Creative Arts - Media Specialist", "Creative Arts - Photo/News", "Creative Arts - Photographer", "Dietary Intern", "Discovery", "High Ropes Assistant", "Housekeeping", "LIT", "Leadership Coordinator", "Lifeguard", "Medical Student", "Nurse (Non-Residential)", "Outdoor Extreme", "Photographer", "Programs Associate", "Psych Intern", "Residential Life Coordinator", "Ropes Course", "Ropes Course Assistant", "Ropes Director", "Security", "Team Adventure", "Unit Leader", "Volunteer Associate"]

  User.where(admin: true).each do |admin|
    # TODO: Give admin users a position
  end
end
