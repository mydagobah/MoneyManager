# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MoneyManager::Application.initialize!

Time::DATE_FORMATS[:create_time] = "%Y/%m/%d"
