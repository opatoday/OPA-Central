class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer   :user_id
      t.integer   :opa_id
      t.integer   :ocp_id
      t.string    :salutation
      t.string    :first_name
      t.string    :last_name
      t.string    :maiden_name
      t.string    :suffix
      t.string    :sponsor
      t.string    :home_phone
      t.integer   :mail_to
      t.integer   :email_to
      t.boolean   :send_snail_mail
      t.boolean   :send_email
      t.boolean   :send_newsletter
      t.string    :home_fax
      t.string    :home_district
      t.string    :work_phone
      t.string    :work_fax
      t.date      :date_of_birth
      t.string    :gender
      t.string    :birth_country
      t.boolean   :deceased
      t.integer   :role
      t.string    :status
      t.text      :comments
      t.integer   :graduation_year
      t.integer   :internship_year
      t.integer   :membership_start_year
      t.boolean   :privacy_agreement
      t.string    :cell_phone
      t.string    :title
      t.string    :degree
      t.integer   :membership_type
      t.timestamps
    end
  end
end
