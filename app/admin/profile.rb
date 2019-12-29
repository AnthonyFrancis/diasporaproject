ActiveAdmin.register Profile do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs "Account Details", :multipart => true do
    f.input :id
  	f.input :photo, :as => :file, :hint => image_tag(f.object.photo.url,width:100,height:100)
    f.input :name
    f.input :investor_type
    f.input :location
    f.input :mininvest
    f.input :maxinvest
    f.input :angelurl
    f.input :website_url
    f.input :angellist_url
    f.input :linkedin_url
    f.input :twitter_url
    f.input :created_at
  end
  f.actions
end


index do
    selectable_column
    column :id
    column "photo" do |f|
      image_tag(f.photo.url,width:50,height:50)
    end
    column :name
    column :investor_type
    column :location
    column :mininvest
    column :maxinvest
    column :angelurl
    column :website_url
    column :angellist_url
    column :linkedin_url
    column :twitter_url
    column :created_at
    actions
  end

permit_params :id, :photo, :name, :investor_type, :location, :mininvest, :maxinvest, :angelurl, :website_url, :angellist_url, :linkedin_url, :twitter_url, :created_at

end
