require 'dwolla_v2'
require 'faker'

$dwolla = DwollaV2::Client.new(id: ENV["DWOLLA_KEY"], secret: ENV["DWOLLA_SECRET"]) do |optional_config|
  optional_config.environment = :sandbox
end

@token = $dwolla.auths.client scope: "ManageCustomers|Funding|Transactions|Send"
@routing_number = "222222226"

