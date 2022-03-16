class Nominee < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :nominee, class_name: "User"
end
