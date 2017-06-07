module UsersHelper
  def display_name(user)
    name = user.first_name.to_s
    name += " \"#{user.nickname}\"" if user.nickname.present?
    name += " #{user.last_name}"
    name += " (fm. #{user.maiden_name})" if user.maiden_name.present?
    name
  end

  def display_city_state(user) 
    [user.city, user.state].select(&:present?).join(", ")
  end
end