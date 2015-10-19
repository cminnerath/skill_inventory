require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test

  def create_skills(num)
    SkillInventory.create(  {:title       => "title#{num}",
                             :description => "description#{num}"})
  end

  def test_it_creates_a_skill
    create_skills(2)
    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal "title2", skill.title
    assert_equal "description2", skill.description
    assert_equal SkillInventory.all.first.id, skill.id
  end

  def test_it_can_find_all_skills
    create_skills(3)
    skill = SkillInventory.find(SkillInventory.all.last.id)

    assert_equal 'title3', skill.title
    assert_equal 'description3', skill.description
  end
end
