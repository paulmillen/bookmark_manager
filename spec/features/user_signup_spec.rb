require 'web_helper'

feature 'User signup and registration' do

  scenario 'user can register' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, barney@barney.com'
    expect(User.first.email).to eq('barney@barney.com')
  end

  scenario 'user cant register if confirmation password doesnt match' do
    expect { password_confirmation_fail }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).not_to have_content 'Welcome, barney@barney.com'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email is blank' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).not_to have_content('Welcome')
  end

  scenario 'email is invalid' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'no double users' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end
