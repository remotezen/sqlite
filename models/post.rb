class Post < ActiveRecord::Base
  
  attr_accessible :image, :image_cache, :remove_image, :title, :body, :account_id, :post_id
  belongs_to :account
  has_one :recipe
  has_many :comments, dependent: :destroy
#  has_one :recipe, :dependent: :destroy

  validates_presence_of :title
  validates_presence_of :body
  before_save  :make_slug
 # mount_uploader :image, Uploader
  
  def to_param
    slug
  end
  
  def slug
    title.gsub(" ","-")
  end
  private
    def make_slug
      self.slug = slug
    end
 end
