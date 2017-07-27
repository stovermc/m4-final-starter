require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  let(:user) { FactoryGirl.create(:user) }
  scenario "Mark a link as read" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('td.read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('td.read-status') do
      expect(page).to have_text("true")
    end
  end
end
