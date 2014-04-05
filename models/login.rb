class Login < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :account_id
  #validates_presence_of :logged_in
def logged_in
    self.read_attribute(:published) == "\x01" ? true : false 
  end
end

  
