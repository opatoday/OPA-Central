class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter do
    headers['X-Slimmer-Template'] = 'admin'
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
  
  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user : 'Unknown user'
  end
end
