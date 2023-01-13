ActiveAdmin.register Address do
  menu priority: 1
  
  permit_params :id, :city, :street, :house, :flat, :patient_id

  filter :city
  filter :street
  filter :house
  filter :flat
  filter :updated_at, as: :date_time_picker_filter, picker_options: { timepicker: false }
  filter :created_at, as: :date_time_picker_filter, picker_options: { timepicker: false }

  form do |f|
    f.inputs do
      f.input :patient_id, as: :search_select, url: admin_patients_path, fields: [:last_name, :first_name], display_name: :name, order_by: 'id_asc'
      f.input :city
      f.input :street
      f.input :house
      f.input :flat
    end

    f.actions
  end
end
