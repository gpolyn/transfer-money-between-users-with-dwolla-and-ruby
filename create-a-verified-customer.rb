require './initialization.rb'

body = {:body => {
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
}

@merchant_customer = DwollaSwagger::CustomersApi.create(body)

@merchant_customer_name = firstName + " " + lastName

# confirm status of new customer
customer = DwollaSwagger::CustomersApi.get_customer(@merchant_customer)
raise "hell" unless customer.status == "verified"

p customer.status + " customer is " + @merchant_customer_name + " @ " +  @merchant_customer
