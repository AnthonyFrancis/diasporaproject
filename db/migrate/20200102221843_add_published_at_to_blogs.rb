class AddPublishedAtToBlogs < ActiveRecord::Migration[5.2]
  def change
  	change_table :blogs do |t|
  		t.string   "state",        default: "draft", null: false
      	t.datetime "published_at"
      	t.string   "publisher"
    end
   	add_index "blogs", ["published_at"], name: "blogs_published_at_idx", using: :btree
	add_index "blogs", ["state"], name: "blogs_state_idx", using: :btree
	add_index "blogs", ["title"], name: "blogs_title_idx", using: :btree
  end
end
