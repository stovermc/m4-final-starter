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
  end
end
