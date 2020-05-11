# London Takeaway

---

A simple Object Orientated app, simulating a classic London Takeaway Resturant - functions via the command line. Test driven in Ruby with the RSpec library, this showcases good coding prncipals: Encapsulation, DRY, SRP, TDD. Built on the a set of user stories. The `Twilio` gem and `dotenv` gem were used. The Twilio gem was used to send a text message to a users mobile phone once an order has been placed. The dotenv gem was used to hide the API key, and avoid the credentials being published on the internet.

## User Stories

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

---

## How to Run

Clone this repo, and from the command line navigate to the [_London Takeaway_](london_takeaway). In the command line type in:

```
bundler
```

This will install the required gems.

### Use your own Twilio Credentials

first, create your own `.env` file. In the command line type:

```
touch .env
```

Inside of the file, type in the following:

```
SID=''        Your Account SID
TOKEN=''      Your Auth Token
FROM=''       Your Twilio Number
TO=''         Your Phone Number
```

Update your .env file with the correct Twilio information. In order to access the Twilio API to send texts to the user, you must [sign up](https://www.twilio.com/) for a Twilio account (it's free) and populate the .env file with the correct information.

Then in the command line type in:

```
irb
```

This will start the Ruby REPL. Then type the following:

```
require './lib/takeaway'
```

This will require the files you need to instantiate the requried objects. This can be actioned by the following command:

```
takeaway = Takeaway.new
```

You can then type in the following in the command line to action the objects accordingly:

```
takeaway.view_menu
takeaway.order_item(item, quantity)
takeaway.finalise_order
```

You will then recieve a text message from the Twillio gem saying `Thank you, your order has been placed and will arrive at 16:40` (an hours time from when finalise.order was actioned.)

---

## Run Tests

To run the test suite (RSpec), in the command line type:

```
rspec
```

This will display 14 passing tests with 96% coverage.
