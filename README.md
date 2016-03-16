# transfer money between users with dwolla_v2

Execute the steps for transferring money between users from [developers.dwolla.com/guides](https://developers.dwolla.com/guides/transfer-money-between-users), using the Dwolla **dwolla_v2** Ruby client
([github.com/Dwolla/dwolla-v2-ruby]((https://github.com/Dwolla/dwolla-v2-ruby))).

## install

Clone this repository:

	$ git clone github.com/gpolyn/transfer-money-between-users-with-dwolla-and-ruby.git

Switch to *dwolla_v2* branch:
	
	$ git checkout dwolla_v2	

Install dependencies:

    $ bundle install

## configure

Log in to [uat.dwolla.com/applications](https://uat.dwolla.com/applications), choose (or register) an application and encode its key and secret as *DWOLLA_KEY* and *DWOLLA_SECRET*, perhaps as follows:

	$ export DWOLLA_KEY=[api key] && DWOLLA_SECRET=[api secret]

## usage

Initial steps outlined at [developers.dwolla.com/guides/transfer-money-between-users](https://developers.dwolla.com/guides/transfer-money-between-users) are encoded in **.rb** files with matching names.

The full guide is not implemented, however, due to an unresolved API error in **attach-a-verified-funding-source.rb** (for a complete Ruby guide implementation that does not use **dwolla_v2**, see the *master* branch.)

## TODO

Resolve the API error in **attach-a-verified-funding-source.rb** and encode remaining steps from the guide, using **dwolla_v2**.
