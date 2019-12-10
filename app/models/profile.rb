class Profile < ApplicationRecord
	belongs_to :list, optional: true

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpg"
	validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
end
