
class Member < ActiveRecord::Base
  self.table_name = "member"
  self.primary_key = "member_id"

  validates :user_name, presence: true
end