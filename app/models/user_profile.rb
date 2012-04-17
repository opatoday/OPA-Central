class UserProfile < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  
  has_paper_trail
  # attr_accessible :title, :body
  
end
