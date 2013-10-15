require "test_helper"

feature "I want to add a portfolio item" do
  scenario "adding a new project" do

    #Given a completed portfolio post form
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "McDonalds Website"
    fill_in "Technologies used", with: "Hammer and rifle"


    # When I submit the form
    click_on 'Create Project'

    # Then I should see the new post
    page.text.must_include "Project was successfully added"
    page.text.must_include "McDonalds Website"
    page.text.must_include "Hammer and rifle"

  end

  scenario "new project has invalid data" do
    # given invalid project data is entered in a form
    visit new_project_path
    save_and_open_page
    #click_on "New Project"
    fill_in "Name", with: "Q"
    fill_in "Technologies used", with: ""

    # when the form is submitted with a short name and missing tech field
    click_on "Create Project"

    # then the form should be displayed again, with error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used is missing"
  end

end
