ActiveAdmin.register Product do
  permit_params :product_brand_id, :product_type_id, :product_number, :name, :description, :price, :image, :extended_data
  remove_filter :image_attachment, :image_blob

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
