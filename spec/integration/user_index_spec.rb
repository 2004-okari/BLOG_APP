require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  scenario 'visiting the user index page' do
    User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')
    User.create(name: 'Ali', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png')

    visit users_path

    expect(page).to have_content('Tom')
    expect(page).to have_content('Ali')
    expect(page).to have_css("img[alt='Tom']", count: 3)
    expect(page).to have_css("img[alt='Ali']", count: 1)
  end

  scenario 'visiting the user index page, you see the number of posts each user has written..' do
    visit users_path

    expect(page).to have_content('Number of posts')
    expect(page).to have_content('0')
  end

  scenario 'clicking on a user redirects to their show page' do
    user = User.create(name: 'Salim')

    visit users_path

    click_link 'Salim'

    expect(page).to have_current_path(user_path(user))
  end
end