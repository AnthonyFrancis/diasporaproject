class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  before_destroy { messages.destroy_all }

  has_one :list
  has_many :syndicates, dependent: :destroy

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpg"
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)

  validates :email, :name, presence: true
  validates_uniqueness_of :username, :exclusion => %w(about blog application books likes pages passwords profiles recommendations registrations users manuscripts stories jobs plans account admin signin signout signup help new popular shop tour)

  # THE RELATIONSHIPS ARE CONTRADICTING WE'LL COME BACK TO THIS LATER ON
  # has_many :forms, dependent: :destroy
  # belongs_to :form

  def has_list?
    list.present?
  end

  def subscribed?
    stripe_subscription_id?
  end

  def stripe_customer
    if stripe_id?
      Stripe::Customer.retrieve(stripe_id)
    else
      stripe_customer = Stripe::Customer.create(email: email)
      update(stripe_id: stripe_customer.id)
      stripe_customer
    end
    
  end

  def basic_plan?
    plan == 'monthbasic'
  end

  def pro_plan?
    plan == 'monthpro'
  end

  def plan_limit_reached?
    basic_plan? && list.investors.count == 25 || pro_plan? && list.investors.count == 50
  end

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def to_param
    username
  end
end
