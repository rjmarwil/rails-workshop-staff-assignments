class Person < ActiveRecord::Base

  validates :last_name, presence: true
  validate :fields

  def fields
    unless title.present? || first_name.present?
      errors.add(:base, "First name and title cannot be blank")
    end
  end

end
