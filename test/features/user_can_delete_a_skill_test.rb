require_relative '../test_helper'

class DeleteTest < FeatureTest
  def user_can_edit_skills_test
    SkillInventory.create(title: "New skill (and it is awesome)", description: "New Desc")
    visit '/skills'
    click_link 'Delete'

    refute page.has_content?("actually, not awesome")
    refute page.has_content?("ignore!")
  end
end
