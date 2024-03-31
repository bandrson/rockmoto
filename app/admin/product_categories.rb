ActiveAdmin.register ProductCategory do
  permit_params :parent_id, :name
  remove_filter :parent
end
