class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :uid, :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_readonly :uid
  
  has_many :authorisations, :class_name => 'Doorkeeper::AccessToken', :foreign_key => :resource_owner_id

  def to_sensible_json
    to_json(:only => [:uid, :version, :name, :email, :github, :twitter])
  end

  def gravatar_url(opts = {})
    opts.symbolize_keys!
    qs = opts.select { |k, v| k == :s }.collect { |k, v| "#{k}=#{Rack::Utils.escape(v)}" }.join('&')
    qs = "?" + qs unless qs == ""

    "#{opts[:ssl] ? 'https://secure' : 'http://www'}.gravatar.com/avatar/" +
      Digest::MD5.hexdigest(email.downcase) + qs
  end
end
