class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpg"
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :username, :exclusion => %w(about blog application books likes pages passwords profiles recommendations registrations users manuscripts stories jobs plans account admin signin signout signup help new popular shop tour)

  def to_param
    username
  end
end
