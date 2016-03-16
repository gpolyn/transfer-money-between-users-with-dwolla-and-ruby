require './attach-a-verified-funding-source-with-microdeposits.rb'
require './attach-an-unverified-funding-source.rb'

transfer_request = {
  :_links => {
      :destination => {:href => @merchant_customer},
      :source => {:href => @buyer_funding_source}
  },
  :amount => {:currency => 'USD', :value => 225.00}
}

@xfer = DwollaSwagger::TransfersApi.create({:body => transfer_request})
p "transfer from " + @buyer_funding_source + " to " + @merchant_customer + " @ " + @xfer

