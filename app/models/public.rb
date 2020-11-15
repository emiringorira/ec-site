class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  # enum is_deleted: {Invalid: true, Available: false}

  def active_for_authentication?
  	super && !self.is_deleted # 有効: TRUE, 無効: FALSE
  end
end


# TRUE AND(&&) TRUE => TRUE
# TRUE AND FALSE => FALSE
# FALSE AND FALSE => FALSE

# TRUE OR(||) TRUE => TRUE
# TRUE OR FALSE => TRUE
# FALSE OR FALSE => FALSE

# NOT(!)
