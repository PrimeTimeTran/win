class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inversefriendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inversefriends, :through => :inverse_friendships, :source => :user


  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password

  def incoming_messages
    Message.where(recipient_id: id)
  end

  def received_messages
    Message.where(recipient: self)
  end

  def sent_messages
    Message.where(sender: self)
  end

  def latest_received_messages(n)
    received_messages.order(created_at: :desc).limit(n)
  end


  def unread_messages
    received_messages.unread
  end

  def to_s
    email
  end

end
