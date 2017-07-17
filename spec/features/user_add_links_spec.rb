require 'rails_helper'

describe "user can add links from the homepage", js: true do
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
      click_link_or_button "Save"
    end

    within('#link-list') do
      expect(page).to have_content "http://turing.io"
      expect(page).to have_content "Turing"
      expect(page).to have_content "Read: false"
    end
  end

  it "url must be valid" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end
    within('.errors') do
      expect(page).to have_content 'Url is not a valid URL'
    end
  end

  it "title cannot be blank" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      click_link_or_button "Save"
    end
    within('.errors') do
      expect(page).to have_content "Title can't be blank"
    end
  end
end
