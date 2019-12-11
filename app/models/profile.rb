class Profile < ApplicationRecord
	belongs_to :list, optional: true

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpg"
	validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)

	def self.to_csv
		attributes = %w[id name location angelurl twitter_url linkedin_url angellist_url website_url investor_type]

		CSV.generate(headers: true) do |csv|
			csv << attributes

			all.each do |investor|
				csv << attributes.map{ |attr| investor.send(attr) }
			end
		end
	end
end
