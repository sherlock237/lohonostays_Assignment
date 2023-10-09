### lohonostays Assignment .

* Ruby version -- 2.6.10

### Getting Started

* Clone this repository

Manually

* Please install ruby version -- 2.6.10

* <tt>bundle install</tt> -- To install the necessary gem

* <tt>rake db:create</tt>

* <tt>rake db:migrate</tt>

* <tt>rake db:seed_villas</tt> -- To Seed the database for 50 villas with each having calendar starting from 1-1-2023 to 31-12-2023 with randomized availability and randomized price between 30,000 to 50,000

* <tt>rails s</tt>


### Docker Build

* <tt>docker build -t lohonostays .</tt>

* <tt>docker run -p 3000:3000 lohonostays</tt>


### Test Case Run

* <tt>bundle exec rspec</tt>



### Postman API Collection

* Link:  https://elements.getpostman.com/redirect?entityId=23321562-e80d3797-f6b1-4367-92fc-a3fcd660ef42&entityType=collection


### Screen Shots of API and Response

##### API to Show average price and availability on a given dates and sort by price

* API
https://drive.google.com/file/d/1D0-Q4QkXZNjO7LLMudCLpbS83cyWn7pc/view?usp=sharing

* Response
https://drive.google.com/file/d/10y5zkrgIZt229qcfyEE9U1482v4dSM2e/view?usp=sharing

##### API to Show average price and availability on a given dates and sort by availability

* API
https://drive.google.com/file/d/1w0DLRvn066tFCMMu54oBEkPZgxhtq8Do/view?usp=sharing

* Response
https://drive.google.com/file/d/1gM_-I5qaUO6D57Wle5FNRVRb4szxTyjq/view?usp=sharing


#####  API to show the total price and availability of a villa on a given dates

* https://drive.google.com/file/d/1taIgiluazLIbRo04MrzlvJ-jQWi2MkM_/view?usp=sharing
