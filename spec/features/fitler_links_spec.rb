require "rails_helper"

RSpec.describe "can filter links", :js => :true do
  let(:user) { FactoryGirl.create(:user) }
  scenario "can filter by title" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('#new-link') do
      fill_in "URL:", with: "http://www.google.com"
      fill_in "Title", with: "Google"
      click_link_or_button "Save"
    end

    within('#filter') do
      fill_in "Filter:", with: "G"

    end

    within('#link-list') do
      expect(page).to have_content("Google")
    end
  end

  scenario "can filter by URL" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('#new-link') do
      fill_in "URL:", with: "http://www.google.com"
      fill_in "Title", with: "Google"
      click_link_or_button "Save"
    end

    within('#filter') do
      fill_in "Filter:", with: "www.g"

    end

    within('#link-list') do
      expect(page).to have_content("Google")
    end
  end
end
