require './create-a-verified-customer.rb'

resource = 'customers/' + @merchant_customer_id + "/funding-sources"

data = {
  :routingNumber => @routing_number,
  :accountNumber => "" + Faker::Number.number(9),
  :type => "checking",
  :name => @merchant_customer_name + " - Checking"
}

begin
  @merchant_funding_source = @token.post resource, data
rescue DwollaV2::ValidationError => e
  p e
end

p "verified customer " + @merchant_customer_name + "'s unverified funding source @ " +  @merchant_funding_source.headers["location"]
# p "verified customer " + @merchant_customer_name + "'s unverified funding source @ " +  @merchant_funding_source

# funding_sources_resource = "/customers/" + @merchant_customer_id + "/funding-sources"
# funding_sources = @token.get funding_sources_resource

# if funding_sources.body[:_embedded][:'funding-sources'][0][:status] == "verified" 
#   raise 'unverified funding source IS verified' 
# end
