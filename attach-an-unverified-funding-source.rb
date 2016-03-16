require './create-a-verified-customer.rb'

@merchant_customer_funding_source = DwollaSwagger::FundingsourcesApi.create_customer_funding_source(@merchant_customer, {:body =>{
  :routingNumber => @routing_number,
  :accountNumber => "" + Faker::Number.number(9),
  :type => "checking",
  :name => @merchant_customer_name + " - Checking"
}
})

p "verified customer " + @merchant_customer_name + "'s unverified funding source @ " +  @merchant_customer_funding_source
