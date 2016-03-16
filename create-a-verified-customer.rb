require './initialization.rb'

resource = "/customers"

data = {
  :firstName => firstName = Faker::Name.first_name,
  :lastName => lastName = "Merchant",
  :email => Faker::Internet.email(firstName + lastName),
  :address1 => Faker::Address.street_address,
  :city => Faker::Address.city,
  :state => Faker::Address.state_abbr,
  :postalCode => Faker::Address.zip_code,
  :dateOfBirth => Faker::Date.birthday().strftime("%F"),
  :ssn => Faker::Number.number(4),
  :phone => Faker::Number.number(10),
  :type => "personal"
}

begin
  new_customer = @token.post resource, data
rescue DwollaV2::ValidationError => e
  p e
end

@merchant_customer_name = firstName + " " + lastName

@merchant_customer_url = new_customer.headers[:location]

customer = @token.get @merchant_customer_url

@merchant_customer_id = customer.body[:id]

raise "hell " unless customer.body[:status] == "verified" 

p customer.body[:status] + " customer is " + @merchant_customer_name + " @ " +  @merchant_customer_url
