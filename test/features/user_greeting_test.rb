require_relative '../test_helper'

class GreetingTest < FeatureTest
  def test_user_can_see_the_correct_greeting
    visit "/"
    assert_equal "/", current_path
    within("#greeting") do
      assert page.has_content?("Welcome to the Skill Inventory")
    end
  end
end
