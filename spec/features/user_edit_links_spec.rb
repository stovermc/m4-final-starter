require 'rails_helper'

describe "user can update a link", js: true do
  let(:user) { FactoryGirl.create(:user) }
  it "user is taken to edit form" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('.link') do
      click_on 'Edit'
    end

    expect(current_path).to eq '/links/1/edit'
  end

  it "user can edit title" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('.link') do
      click_on 'Edit'
    end

    fill_in 'Title', with: "School"
    click_on 'Save'

    expect(current_path).to eq root_path
    expect(page).to have_content "School"
  end

  it "user can edit URL" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('.link') do
      click_on 'Edit'
    end

    fill_in 'Url', with: "http://www.google.com"
    click_on 'Save'

    expect(current_path).to eq root_path
    expect(page).to have_content "http://www.google.com"
  end

  it "user cannot edit without valid params" do
    login(user)

    within('#new-link') do
      fill_in "URL:", with: "http://turing.io"
      fill_in "Title", with: "Turing"
      click_link_or_button "Save"
    end

    within('.link') do
      click_on 'Edit'
    end

    fill_in 'Url', with: "google.com"
    click_on 'Save'

    expect(current_path).to eq '/links/1'
    expect(page).to have_content "Url is not a valid URL"
  end
end
