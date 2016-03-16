require './create-an-unverified-customer.rb'
require 'json'
require 'typhoeus'

@buyer_funding_source = DwollaSwagger::FundingsourcesApi.create_customer_funding_source(@buyer_customer, {:body =>{
  :routingNumber => @routing_number,
  :accountNumber => "" + Faker::Number.number(9),
  :type => "checking",
  :name => @buyer_customer_name + " - Checking"
}
})

headers = {
  'Content-Type' => content_type = 'application/vnd.dwolla.v1.hal+json',
  'Authorization' => 'Bearer ' + @uat_access_token,
  'Accept' => content_type
}

url =  @buyer_funding_source + "/micro-deposits"

Typhoeus.post(url, headers: headers)

body = {
		:amount1 => {
        :value => "0.03",
        :currency => "USD"
    },
		:amount2 => {
        :value => "0.09",
        :currency => "USD"
    }
}

request = Typhoeus.post(url, method: :post, body: body.to_json, headers: headers)
funding_source = Typhoeus.get(@buyer_funding_source,  headers: headers)
raise "hell" unless JSON.parse(funding_source.body)["status"] == "verified"
p "unverified customer " + @buyer_customer_name + "'s " + JSON.parse(funding_source.body)["status"] + " funding source @ " +  @buyer_funding_source

