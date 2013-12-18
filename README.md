tstapp
======

Test application with Padrino and AngularJS

## Demo

http://tst-app.herokuapp.com


## API examples

###### create company

    curl 'http://tst-app.herokuapp.com/companies' -H 'Content-Type: application/json;' -d '{"company":{"name":"new company","address":"somewhere","city":"London","country":"UK"}}'

###### list companies

    curl 'http://tst-app.herokuapp.com/companies'

###### company details

    curl 'http://tst-app.herokuapp.com/companies/1'

###### update company

    curl 'http://tst-app.herokuapp.com/companies/1' -X PUT -H 'Content-Type: application/json;' -d '{"company":{"address":"new address"}'
