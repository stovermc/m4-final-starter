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
        save_and_open_page
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
        expect(page).to have_content 'Password Confirmation'
      end

    end
  end
end
