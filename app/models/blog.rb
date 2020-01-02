class Blog < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: [:finders, :slugged]
  	has_attached_file :image, :styles => { :medium => "380x230>", :thumb => "100x100>" }
  	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
  	validates :title,        presence: true
  	validates :state,        inclusion: { in: ['Draft', 'Published'] }
  	validates :publisher,    presence: true, if: :published?
  	validates :published_at, presence: true, if: :published?
  	validates :image,   presence: true

  	paginates_per 8

  	# When to regenerate slug
  def should_generate_new_friendly_id?
    title_changed?
  end

  def published?
    state == 'published'
  end
end
