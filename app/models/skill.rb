class Skill < ActiveRecord::Base

  has_many :proficiencies
  has_many :users, :through => :proficiencies

  VALID_CONTEXTS = %w(technical creative)

  validates :name, :presence => true
  validate :validate_context

  private
  def validate_context
    p self.context
    self.errors[:context] = "must be one of: #{VALID_CONTEXTS.join(', ')}" unless VALID_CONTEXTS.include? self.context
  end
end
