require "test_helper"

feature "deleting a post" do
  scenario "post disappears from the planet" do
    post = Post.create(title: "floop", content: "floopydoop")

    # Given a previously created blog post
    visit posts_path
    # When I push the delete button
    # save_and_open_page
    page.find("tr:last").click_on "Destroy"

    # Then the post should be deleted
    page.wont_have_content "floop"
    page.wont_have_content "floopydoop"

  end
end
