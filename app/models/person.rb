class Person < ApplicationRecord
  DEPARTMENTS = %w(Support Marketing Development Finance HR Legal).freeze

  validates :name, :job_title, presence: true, length: { maximum: 48 }
  validates :bio, presence: true, length: { maximum: 512 }
  validates :department, inclusion: { in: DEPARTMENTS, message: 'does not exist' }

  scope :sorted, -> { order('lower(name)') }

  def self.department(department)
    department.blank? ? sorted : sorted.where('lower(department) = ?', department.downcase)
  end

  def first_name
    name.split(' ')[0]
  end
end
