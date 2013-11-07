class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|    
      t.belongs_to :user
      t.belongs_to :skill
      t.integer :years_of_experience
      t.boolean :formal_education
    end
  end
end
