require "test_helper"

feature "I want to delete one of the projects" do
  scenario "a specific project has been wiped off the face of the planet" do

    #Given the list of projects
    visit projects_path
    click_link("Destroy", match: :first)

    # The destroyed one should be gone
    page.text.wont_include "Jordan"

  end


end
