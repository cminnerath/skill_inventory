require_relative '../test_helper'

class EditTest < FeatureTest
  def user_can_edit_skills_test
    SkillInventory.create(title: "New skill (and it is awesome)", description: "New Desc")
    visit '/skills'
    click_link 'Edit'
    assert_equal '/skills/1/edit', current_path

    fill_in("skill[title]", with: "actually, not awesome")
    fill_in("skill[description]", with: "ignore!")
    click_button "Submit"

    assert_equal '/skills/1', current_path
    assert page.has_content?("actually, not awesome")
    assert page.has_content?("ignore!")
  end
end
