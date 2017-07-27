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
      fill_in "Filter:", with: "Goo"

    end

    within('#link-list') do
      expect(page).to have_content("Google")
      expect(page).to_not have_content("Turing")
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
      expect(page).to_not have_content("Turing")
    end
  end

  scenario "read button filters by links read" do
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

    click_on 'Read'

    within('#link-list') do
      expect(page).to_not have_content("Google")
    end
  end

  scenario "Unread button filters by links unread" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    click_on "Mark as Read"

    within('#new-link') do
      fill_in "URL:", with: "http://www.google.com"
      fill_in "Title", with: "Google"
      click_link_or_button "Save"
    end

    click_on 'Unread'

    within('#link-list') do
      expect(page).to_not have_content("Turing")
    end
  end
end
