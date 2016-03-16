require './create-a-transfer.rb'

transfer = DwollaSwagger::TransfersApi.by_id(@xfer)
raise "hell" unless transfer.status == "pending"
p "...transfer status is " + transfer.status

