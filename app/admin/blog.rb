ActiveAdmin.register Blog do

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
    f.input :title
  	f.input :image, :as => :file, :hint => image_tag(f.object.image.url,width:100,height:100)
    f.input :body, :as => :text
    f.input :created_at
  end
  f.actions
end


index do
    selectable_column
    column :id
    column :title
    column "photo" do |f|
      image_tag(f.image.url,width:50,height:50)
    end
    column :body
    column :created_at
    actions
  end

permit_params :id, :image, :body, :created_at

end
