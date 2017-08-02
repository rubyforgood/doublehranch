require 'rails_helper'


RSpec.feature('Update user profile') do
  context('As a logged-in user') do
    scenario('they can cancel their changes') do
      user = create(:user)
      user.confirmed_at = Time.now
      user.save
      login_as(user, :scope => :user)

      visit root_path

      expect(page).to_not have_content('Welcome to Orchard')
      expect(page).to have_content("Hi, #{user.nickname}!")

      within(:css, '.home-hero-username') do
        click_link('Update Info')
      end

      expect(current_path).to eq(edit_user_profile_path(user))
      expect(find_by_id('user_first_name').value).to eq(user.first_name)

      find(:css, '#user_first_name').set('Tyrion')
      click_on('Cancel')

      expect(current_path).to eq(root_path)

      within(:css, '.home-hero-username') do
        click_link('Update Info')
      end

      name = find_by_id('user_first_name').value

      expect(name).to_not eq('Tyrion')
      expect(name).to eq(user.first_name)
    end
  end
end
