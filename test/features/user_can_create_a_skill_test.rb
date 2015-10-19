require_relative '../test_helper'

class CreationTest < FeatureTest
  def test_user_can_create_a_new_skill
    visit '/'
    click_link('New Skill')
    assert_equal '/skills/new', current_path

    fill_in('skill[title]', with: 'test_title')
    fill_in('skill[description]', with: 'test_description')
    click_button 'Submit'
    assert_equal '/skills', current_path
    assert page.has_content?('test_title')

    skill = SkillInventory.all.first
    click_link('test_title')
    assert_equal "/skills/#{skill.id}", current_path
    assert page.has_content?('test_title')
    assert page.has_content?('test_description')
  end
end
