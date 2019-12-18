class Blog < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: [:finders, :slugged]

  	# When to regenerate slug
  def should_generate_new_friendly_id?
    title_changed? || since_changed?
  end
end
