ActiveAdmin.register UserProfile do
  controller do
    def show
      @user_profile = UserProfile.find(params[:id])
      @versions = @user_profile.versions 
      @user_profile = @user_profile.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
    end
  end
  sidebar :versionate, :partial => "layouts/version", :only => :show
  
  filter :first_name
  filter :last_name
  filter :opa_id
  filter :ocp_id
  filter :user_email, :as => :string, :label => "primary email"
  
  index do
    column t(:name), :full_name
    column :home_phone
    column :work_phone
    column :cell_phone
    column t(:primary_email), :user_email
    column :opa_id
    column :ocp_id
    default_actions
  end
  
  form do |f|
    f.inputs "Personal Information" do
      f.input   :salutation
      f.input   :first_name
      f.input   :last_name
      f.input   :maiden_name
      f.input   :suffix
      f.input   :title
      f.input   :sponsor
      f.input   :date_of_birth
      f.input   :gender
      f.input   :birth_country
    end
    f.inputs "Contact Information" do
      f.input   :home_phone
      f.input   :home_fax
      f.input   :home_district
      f.input   :work_phone
      f.input   :work_fax
      f.input   :cell_phone
    end
    f.inputs "Preferences" do
      f.input   :mail_to
      f.input   :email_to
      f.input   :send_snail_mail
      f.input   :send_email
      f.input   :send_newsletter
      f.input   :privacy_agreement
    end
    f.inputs "Administration Settings" do
      f.input   :deceased
      f.input   :membership_type
      f.input   :role
      f.input   :status
      f.input   :comments
    end
    f.inputs "Education" do
      f.input   :graduation_year
      f.input   :internship_year
      f.input   :membership_start_year
      f.input   :degree
    end
    f.buttons
  end
end
