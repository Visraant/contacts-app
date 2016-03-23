class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :group_combines
  has_many :groups, through: :group_combines
  def friendly_time
    updated_at.strftime("%b %e, %l:%M %p")
  end

  def full_name
    "#{first_name}" + " #{middle_name}" + " #{last_name}"
  end

  def country_code
    if phone_number.start_with? "+81"
      return "#{phone_number}"
    else
      return "+81 " + "#{phone_number}"
    end
  end
end
