# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FEMSA::Application.initialize!

# Para que funcionen mis elementos estáticos js, css etc
ENV['RAILS_RELATIVE_URL_ROOT'] = "/FEMSA"