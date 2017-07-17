require 'rails_helper'

describe "user can add links from the homepage", :js => true do
  let(:user) { FactoryGirl.create(:user) }
  it "user can see form to submit new link" do
    login(user)

    within('#new-link') do
      expect(page).to have_content "URL"
      expect(page).to have_content "Title"
      expect(page).to have_button "Save"
    end
  end

  it "user can submit new link" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_on "Save"
    end

    within('.links-list') do
      expect(page).to have_content "Turing"
    end
  end
end
