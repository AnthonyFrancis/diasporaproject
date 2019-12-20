class Blog < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: [:finders, :slugged]
  	has_attached_file :image, :styles => { :medium => "380x230>", :thumb => "100x100>" }
  	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

  	# When to regenerate slug
  def should_generate_new_friendly_id?
    title_changed?
  end
end
