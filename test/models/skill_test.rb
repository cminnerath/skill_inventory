require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    skill = Skill.new({ :title     => 'nothing important',
                      :description => 'descriptionation',
                      :id          => 15000 })
    assert_equal 15000, skill.id
    assert_equal 'nothing important', skill.title
    assert_equal 'descriptionation', skill.description
  end
end
