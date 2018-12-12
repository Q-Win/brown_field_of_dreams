class Friendship < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  belongs_to :friend, class_name: 'User'
=======
  belongs_to :user, foreign_key: "user_id"
>>>>>>> master
end
