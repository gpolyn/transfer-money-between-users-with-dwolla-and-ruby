# transfer money between users with dwolla_swagger

Execute the steps for transferring money between users described at [developers.dwolla.com/guides](developers.dwolla.com/guides/transfer-money-between-users) with the Dwolla **dwolla_swagger** Ruby client
 ([github.com/Dwolla/dwolla-swagger-ruby]((github.com/Dwolla/dwolla-swagger-ruby))).

## install

Clone this repository:

	$ git clone github.com/gpolyn/transfer-money-between-users-with-dwolla-and-ruby

Switch to *dwolla_swagger* branch:
	
	$ git checkout dwolla_swagger

Install dependencies:

    $ bundle install

## configure

There may be a more elegant/programmatic way to obtain the access token, but the following steps worked for me:

1. (register at [uat.dwolla.com](uat.dwolla.com))
2. Request a token at [tokengenerator.dwolla.com](tokengenerator.dwolla.com):

![request token](./img/select-scopes-at-dwolla-tokengenerator.png)

3. Follow redirect to login and authorize the scopes
4. Collect 'access_token':

![collect access token](./img/find-access-token-at-dwollagenerator.png)

Encode the token in *DWOLLA_UAT_ACCESS_TOKEN*, perhaps as follows:

	$ export DWOLLA_UAT_ACCESS_TOKEN=[token]

## usage

Steps outlined at [developers.dwolla.com/guides/transfer-money-between-users](developers.dwolla.com/guides/transfer-money-between-users) are encoded in **.rb** files with matching names. Run the whole guide at once:

	$ ruby check-the-status-of-your-transfer.rb

(**dwolla_swagger** is not used for all API calls in **attach-a-verified-funding-source-with-microdeposits.rb**, after errors arose using the SDK for micro-deposit resource interaction.)

## TODO

Swap out **typheous** for **dwolla_swagger** to handle *all* API calls in **attach-a-verified-funding-source-with-microdeposits.rb**.
