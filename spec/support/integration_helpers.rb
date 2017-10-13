# spec/support/integration_helpers.rb
def show_page
  save_page Rails.root.join( 'public', 'capybara.html' )
  %x(launchy http://localhost:3000/capybara.html)
end
