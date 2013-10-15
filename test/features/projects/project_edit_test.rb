require "test_helper"

feature "I want to edit a portfolio item" do
  scenario "editing project" do

    #Given a completed portfolio post form
    visit edit_project_path(projects(:first))
    fill_in "Name", with: "Wendys Website"
    # save_and_open_page
    click_on "Edit Project"

    # Then I should see the new post
    page.text.must_include "Wendys Website"
    page.text.wont_include "McDonalds Website"

  end



end
