class SkillInventory

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.all
    dataset.map {|skill| Skill.new(skill)}
  end

  def self.find(id)
    Skill.new(dataset.where(:id => id).to_a.first)
  end

  def self.create(skill)
    database.from(:skills).insert(skill)
  end

  def self.update(id, skill)
    dataset.where(id: id).update(data)
  end

  def self.delete(id)
    dataset.where(:id => id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:skills)
  end
end
