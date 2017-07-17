require 'rails_helper'

describe "user can update a link", js: true do
  let(:user) { FactoryGirl.create(:user) }
  xit "user can edit title" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('')
  end
end
