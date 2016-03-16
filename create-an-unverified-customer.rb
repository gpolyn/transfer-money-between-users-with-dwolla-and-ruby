require './initialization.rb'

data = {
  :firstName => firstName = Faker::Name.first_name,
  :lastName => lastName = "Buyer",
  :email => Faker::Internet.email(firstName + lastName),
}

resource = "/customers"

begin
  new_customer = @token.post resource, data
rescue DwollaV2::ValidationError => e
  p e
end

@buyer_customer_url = new_customer.headers[:location]

customer = @token.get @buyer_customer_url

@buyer_customer_id = customer.body[:id]

@buyer_customer_name = firstName + " " + lastName

p "unverified customer is " + @buyer_customer_name + " @ " +  @buyer_customer_url
