class Profile < ApplicationRecord
	belongs_to :list, optional: true

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpg"
	validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)

	def self.to_csv
		# TODO: rename your CSV headers so you can easily call the table columns
		# This is hacky but it works
		attributes = ['name', 'Investor Type', 'Min Investment', 'Max Investment', 'Website Url', 'Twitter Url', 'Angellist Url', 'LinkedIn Url']

		CSV.generate(headers: true) do |csv|
			csv << attributes

			all.each do |investor|
				csv << attributes.map do |attr|
					if Profile.method_defined?(attr.downcase.parameterize(separator: '_'))
						method = attr.downcase.parameterize(separator: '_')
					else
						method = attr.downcase.parameterize(separator: '').gsub('ment',  '')
					end

					investor.send(method)
				end
			end
		end
	end
end
