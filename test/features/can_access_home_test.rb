require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  test "visit the home page" do
  	visit 'http://localhost:3000/'
  	 page.must_have_content '主页'
  end
end
