require 'dwolla_swagger'
require 'faker'

DwollaSwagger::Swagger.configure do |config|
    config.host = 'api-uat.dwolla.com'
    config.access_token = @uat_access_token = ENV['DWOLLA_UAT_ACCESS_TOKEN']
end

@routing_number = "222222226"
