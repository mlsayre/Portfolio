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
end
