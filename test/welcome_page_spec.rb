require "test_helper"

describe "My portfolio welcome page" do
	it "has a welcome headline" do
		visit "http://localhost:3000/public/"
		page.text.must_include "Welcome to Matt's portfolio!"
	end
end
