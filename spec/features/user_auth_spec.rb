require "rails_helper"

describe "user authentication" do
  context "guest user visits root" do
    it "they are redirected to 'user_login'" do
      visit root_path

      expect(current_path).to eq login_path
      within('#login') do
        expect(page).to have_content 'Sign In'
        expect(page).to have_content 'New User? Sign Up!'
      end
    end

    it "they see a form with email and password fields" do
      visit root_path
      click_on 'Sign Up!'

      within('#new_user_form') do
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
        expect(page).to have_content 'Password confirmation'
      end
    end

    it "redirects to link index upon account creation" do
      visit new_user_path

      fill_in 'Email', with: 'stovermc@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with:'password'
      click_on 'Create Account'

      expect(current_path).to eq root_path
    end
  end
end
