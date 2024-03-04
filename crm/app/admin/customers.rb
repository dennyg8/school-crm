ActiveAdmin.register Customer do
  remove_filter :image_attachment, :image_blob

  permit_params :full_name, :phone_number, :email_address, :notes, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    column :image do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), height: '100'
      else
        "No Image"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end
