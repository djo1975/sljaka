# spec/features/welcome_spec.rb

require 'rails_helper'

RSpec.feature 'Welcome Page' do
  scenario 'User is not signed in' do
    visit root_path

    expect(page).to have_selector('h1', text: 'Welcome to RealTimeSearchApp')
    expect(page).to have_content('Please sign in or sign up to continue.')
    expect(page).to have_link('sign in', href: new_user_session_path)
    expect(page).to have_link('sign up', href: new_user_registration_path)
  end
end
