ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
def sign_in_user
  visit new_user_session_path
  fill_in "Email", with: users(:one).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: users(user).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

def new_comment
  visit post_path(posts(:cd).id)
  fill_in :comment_author, with: "Jerky Jerkface"
  fill_in :comment_author_url, with: "www.example.com"
  fill_in :comment_author_email, with: "Jerk@example.com"
  fill_in :comment_content, with: "Your post sucks and I hate you."
  click_on "Create Comment"
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

Turn.config.format = :outline
end
