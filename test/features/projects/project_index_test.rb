require "test_helper"

feature "I want to see all the projects" do
  scenario "all projects seen" do

    #Given a completed portfolio post form
    visit projects_path

    # Then I should see the new post
    page.text.must_include "Jordan"
    page.text.must_include "Oh my"

  end


end
