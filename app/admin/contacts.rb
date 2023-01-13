ActiveAdmin.register Contact do
  menu priority: 2

  permit_params :id, :contact_type, :contact_value, :patient_id

  filter :contact_type, as: :select, collection: Contact::CONTACTS_TYPE.invert.to_a
  filter :contact_value, as: :string
  filter :updated_at, as: :date_time_picker_filter, picker_options: { timepicker: false }
  filter :created_at, as: :date_time_picker_filter, picker_options: { timepicker: false }

  index do
    selectable_column
    id_column
    column :contact_type do |f|
      Contact::CONTACTS_TYPE[f.contact_type]
    end
    column :contact_value
    column :patient
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :patient_id, as: :search_select, url: admin_patients_path, fields: [:last_name, :first_name], display_name: :name, order_by: 'id_asc'
      f.input :contact_type, as: :select, collection: Contact::CONTACTS_TYPE.invert.to_a
      f.input :contact_value
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :patient
      row :contact_type do |f|
        Contact::CONTACTS_TYPE[f.contact_type]
      end
      row :contact_value
      row :updated_at
      row :created_at
    end

    active_admin_comments
  end
end
