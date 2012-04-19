class UserProfile < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  
  has_paper_trail
  # attr_accessible :title, ::body
  
  belongs_to :user
  
  attr_accessible :first_name, :last_name, :salutation, :maiden_name, :suffix, :title, :sponsor, :date_of_birth, :gender, :birth_country, :home_phone, :home_fax, :home_district, :work_phone, :work_fax, :cell_phone, :mail_to, :email_to, :send_snail_mail, :send_email, :send_newsletter, :privacy_agreement, :deceased, :membership_type, :role, :status, :comments, :graduation_year, :internship_year, :membership_start_year, :degree
  
  delegate :email, :to => :user, :prefix => true, :allow_nil => true
  
  def full_name
    [self.first_name, self.last_name].join(' ')
  end

end
