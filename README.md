# london_takeaway

---

A simple Object Orientated app, simulating the Santender Cycles around London - functions via the command line. Test driven in Ruby with the RSpec library, this showcases good coding prncipals: Encapsulation, DRY, SRP, TDD. Built on the a set of user stories. Once the user story requirements were met, modules were used as mixins to DRY out the code further, as many classes shared duplicate code. This showcases good Object Composition. The 'Shared Examples' feature of RSpec were also used to feature test the use of modules.

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

This will install the required gems. Then in the command line type in:

```
irb
```

This will start the Ruby REPL. Then type the following:

```
require './'
```

This will require the files you need to instantiate the requried objects. This can be done by the following commands:

```

```

You can then type in the following in the command line to action the objects accordingly:

```

```

---

To run the test suite (RSpec), in the command line type:

```
rspec
```

This will display \_\_ passing tests with 100% coverage.
