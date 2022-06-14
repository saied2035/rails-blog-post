class ApplicationController < ActionController::Base
  scope :current_user, -> { User.first }
end
