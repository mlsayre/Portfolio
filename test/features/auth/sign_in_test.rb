require "test_helper"

feature "I want to sign in to the site" do
  scenario "previously created user successfully signs in" do
    sign_in_user
    # save_and_open_page

    page.text.must_include "Signed in successfully"

  end

  scenario "sign in with twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
      { uid: '12345',
        info: { nickname: 'test_twitter_user'},
        })
    page.first(:link, "Sign in with Twitter").click
    page.must_have_content "test_twitter_user, you are signed in!"
  end

end
