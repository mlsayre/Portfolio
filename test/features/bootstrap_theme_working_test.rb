require "test_helper"

feature "Bootstrap theme loads" do
  scenario "the layout is bootstrapped" do
    visit root_path
    page.body.must_include "sidebar-wrapper"
  end
end
