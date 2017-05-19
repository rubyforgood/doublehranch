# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.test?
  10.times do
    FactoryGirl.create(:user, :admin)
  end

  100.times do
    FactoryGirl.create(:user)
  end
  
  position_names = ["Staff Member", "Camper", "Counselor", "Volunteer"]
  position_types = ["ALCOA", "Activities Coordinator", "Aquatics Director", "Archery", "Arts & Crafts", "Arts & Crafts Assistant", "Arts & Crafts Director", "Barn", "Barn Director", "Barn Manager", "Barn Staff", "CIT", "CIT/LIT Associate", "Counselor", "Creative Arts", "Creative Arts - Media Specialist", "Creative Arts - Photo/News", "Creative Arts - Photographer", "Dietary Intern", "Discovery", "High Ropes Assistant", "Housekeeping", "LIT", "Leadership Coordinator", "Lifeguard", "Medical Student", "Nurse (Non-Residential)", "Outdoor Extreme", "Photographer", "Programs Associate", "Psych Intern", "Residential Life Coordinator", "Ropes Course", "Ropes Course Assistant", "Ropes Director", "Security", "Team Adventure", "Unit Leader", "Volunteer Associate"]
  
  User.where(admin: true).each do |admin|
    # TODO: Give admin users a position
  end
end
