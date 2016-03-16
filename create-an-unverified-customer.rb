require './initialization.rb'

body = {:body => {
  :firstName => firstName = Faker::Name.first_name,
  :lastName => lastName = "Buyer",
  :email => Faker::Internet.email(firstName + lastName),
  # :type => 'personal' # triggers DwollaSwagger::ClientError
  }
}

@buyer_customer = DwollaSwagger::CustomersApi.create(body)
@buyer_customer_name = firstName + " " + lastName

p "unverified customer is " + @buyer_customer_name + " @ " +  @buyer_customer
