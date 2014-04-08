class Login < ActiveRecord::Base
  belongs_to :account
  validates_presence_of  :account_id
  validates_presence_of  :logged_in
  validates_presence_of  :password
  validates_length_of    :password, :within =>3..40
  validates_presence_of  :email
  validates_format_of    :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
def logged_in
    self.read_attribute(:published) == "\x01" ? true : false 
  end
end

  
