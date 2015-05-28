class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {minimum:20, maximum: 5000}

  has_attached_file :picture, :styles => { :large => "1280x720", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  acts_as_votable

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end
