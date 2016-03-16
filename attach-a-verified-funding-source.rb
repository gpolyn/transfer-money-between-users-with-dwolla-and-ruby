require './create-an-unverified-customer.rb'

resource = 'customers/' + @buyer_customer_id + "/funding-sources"

data = {
  :routingNumber => @routing_number,
  :accountNumber => "" + Faker::Number.number(9),
  :type => "checking",
  :name => @buyer_customer_name + " - Checking"
}

begin
  @buyer_funding_source = @token.post resource, data
rescue DwollaV2::ValidationError => e
  p e
end

p "unverified customer " + @buyer_customer_name + "'s unverified funding source @ " + @buyer_funding_source.headers["location"]

funding_sources_resource = "/customers/" + @buyer_customer_id + "/funding-sources"

funding_sources = @token.get funding_sources_resource

funding_source_hash = funding_sources.body[:_embedded][:'funding-sources'][0]
source_id = funding_source_hash[:id]
micro_deposits_resource = '/funding-sources/' + source_id + "/micro-deposits"

p "initiate microdeposits for funding source with resource " + micro_deposits_resource
begin
  blah = @token.post micro_deposits_resource
rescue DwollaV2::ValidationError => e
  p e
rescue DwollaV2::InvalidScopeError => e
  p e
  p "...so, what was the token scope? It appears to have been '" + @token.scope + "'"
end

