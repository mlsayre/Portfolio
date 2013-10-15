require "test_helper"

feature "I want to see one of the projects" do
  scenario "a specific projects seen" do

    #Given a completed portfolio post form
    visit project_path(projects(:first))

    # Then I should see the new post
    page.text.must_include "Jordan"
    page.text.must_include "Best"

  end


end
