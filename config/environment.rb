# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
	:user_name => 'apikey',
	:password => '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',
    :domain    => 'example.com',
	:address => 'smtp.sendgrid.net',
	:port => 587,
	:authentication => :plain,
	:enable_starttls_auto => true
}