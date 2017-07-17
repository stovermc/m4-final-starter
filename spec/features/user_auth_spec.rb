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

      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with:'password'
      click_on 'Create Account'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Success! New Account Created.'
    end

    it "shows message when email is taken" do
      user = FactoryGirl.create(:user)

      visit new_user_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_on 'Create Account'

      expect(page).to have_content 'Email has already been taken'
    end

    it "shows message when password and password_confirmation do not match" do
      visit new_user_path

      fill_in 'Email', with: 'yolo@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'asdf'
      click_on 'Create Account'

      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    it "password field cannot be blank" do
      visit new_user_path

      fill_in 'Email', with: 'yolo@gmail.com'
      click_on 'Create Account'

      expect(page).to have_content "Password can't be blank"
    end
  end

  context "as a registered user, I am able to login" do
    it "shows a form for filling in email and password" do
      visit root_path

      within('#login') do
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
        expect(page).to have_button 'Log In'
      end
    end

    it "after loging in user is directed to link index" do
      user = FactoryGirl.create(:user)

      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log In'

      expect(current_path).to eq root_path
    end
  end
end
