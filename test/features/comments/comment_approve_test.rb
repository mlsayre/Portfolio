require "test_helper"

feature "approving a comment" do
  scenario "author role can approve a comment" do

    #
    new_comment
    sign_in(:author)
    visit post_path(posts(:cd).id)
    #save_and_open_page

    click_on "Edit"
    fill_in 'Title', with: posts(:cd).title
    fill_in 'Content', with: posts(:cd).content

    # When I submit the form
    click_on 'Update Post'

    # Then the post should be changed
    page.text.must_include posts(:cd).title
    page.text.must_include posts(:cd).content


    # And a success message
    page.text.must_include 'Post was successfully updated'

  end
end
