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

 scenario "edited project has invalid data" do
    # given invalid project data is entered in a form
    visit edit_project_path(projects(:first))
    # save_and_open_page
    #click_on "New Project"
    fill_in "Name", with: "Q"
    fill_in "Technologies used", with: ""

    # when the form is submitted with a short name and missing tech field
    click_on "Edit Project"

    # then the form should be displayed again, with error message
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end


end
