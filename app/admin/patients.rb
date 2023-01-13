ActiveAdmin.register Patient do
  menu priority: 0
  
  permit_params :first_name, :last_name, :middle_name, :user_id, :date_of_birth,
                addresses_attributes: [:id, :city, :street, :house,  :flat, :_destroy],
                contacts_attributes: [:id, :contact_type, :contact_value, :_destroy]
                
  filter :last_name
  filter :first_name
  filter :middle_name
  filter :date_of_birth, as: :date_time_picker_filter, picker_options: { timepicker: false }
  filter :updated_at, as: :date_time_picker_filter, picker_options: { timepicker: false }
  filter :created_at, as: :date_time_picker_filter, picker_options: { timepicker: false }

  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :middle_name
    column :date_of_birth
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :date_of_birth, as: :date_time_picker, picker_options: { timepicker: false }

      f.input :user_id, input_html: { value: current_user.id }, as: :hidden

      f.has_many :addresses, new_record: 'New Address', allow_destroy: true do |b|
        b.input :city
        b.input :street
        b.input :house
        b.input :flat
      end

      f.has_many :contacts, new_record: 'New Contact', allow_destroy: true do |b|
        b.input :contact_type, as: :select, collection: Contact::CONTACTS_TYPE.invert.to_a
        b.input :contact_value
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :last_name
      row :first_name
      row :middle_name
      row :date_of_birth
      row :updated_at
      row :created_at
    end

    panel 'Addresses' do
      table_for patient.addresses do
        column :id
        column :city
        column :street
        column :house
        column :flat
        column :updated_at
        column :created_at
      end
    end

    panel 'Contacts' do
      table_for patient.contacts do
        column :id
        column :contact_type
        column :contact_value
        column :updated_at
        column :created_at
      end
    end

    active_admin_comments
  end
end
