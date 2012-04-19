class User < ActiveRecord::Base
  after_create :initialize_profile
  
  has_one :user_profile
  delegate :first_name, :last_name, :to => :user_profile, :prefix => true, :allow_nil => true
  has_many :authorisations, :class_name => 'Doorkeeper::AccessToken', :foreign_key => :resource_owner_id
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :uid, :name, :email, :password, :password_confirmation, :remember_me, :user_profile_attributes
  attr_readonly :uid
  accepts_nested_attributes_for :user_profile
 
  def initialize_profile
    self.create_user_profile
  end
  
  def full_name
    self.user_profile.full_name
  end
  
  def to_sensible_json
    to_json(:only => [:uid, :version, :name, :email])
  end

  def gravatar_url(opts = {})
    opts.symbolize_keys!
    qs = opts.select { |k, v| k == :s }.collect { |k, v| "#{k}=#{Rack::Utils.escape(v)}" }.join('&')
    qs = "?" + qs unless qs == ""

    "#{opts[:ssl] ? 'https://secure' : 'http://www'}.gravatar.com/avatar/" +
      Digest::MD5.hexdigest(email.downcase) + qs
  end
end
