class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users  #大事！　GroupUserモデルを通して複数のユーザを有する
  validates :name, presence: true, uniqueness: true
  attachment :group_image
end
