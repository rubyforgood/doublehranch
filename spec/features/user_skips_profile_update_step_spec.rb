require 'rails_helper'


RSpec.feature('Update user profile') do
  context('As a logged-in user') do
    scenario('they can skip a step') do
      user = create(:user)
      user.confirmed_at = Time.now
      user.save
      login_as(user, :scope => :user)

      visit root_path

      within(:css, '.home-hero-username') do
        find(:css, '#edit-my-profile-button').click
      end

      path = edit_user_profile_path(user)

      expect(current_path).to eq(path)
      expect(find_by_id('user_first_name').value).to eq(user.first_name)

      find(:css, '#user_first_name').set('Tyrion')
      click_on('Skip to Photo')

      expect(current_path).to eq(path)
      expect(page).to have_css('#user_profile_photo')

      click_on('Skip to Password')

      expect(current_path).to eq(path)
      expect(page).to have_content('New Password')

      click_on('Skip to Privacy')

      expect(current_path).to eq(path)
      expect(page).to have_content('PRIVACY')
      expect(page).to_not have_content('Skip to')

      click_on('Orchard')

      expect(current_path).to eq(root_path)

      within(:css, '.home-hero-username') do
        find(:css, '#edit-my-profile-button').click
      end

      name = find_by_id('user_first_name').value

      expect(name).to_not eq('Tyrion')
      expect(name).to eq(user.first_name)
    end
  end
end
