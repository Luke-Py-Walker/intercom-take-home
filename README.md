
# intercom-take-home

Solution for intercom take home assignment. A program to read a full list of customers and output     
the names and user ids of matching customers (within 100km), sorted by User ID (ascending).    
    
## Getting Started
    
### Set Up

You'll first want to install ruby version 2.6.3. I recommend using [rbenv](https://github.com/rbenv/rbenv#installation)    
Once installed, navigate to the root directory of the repository and enter `bundle install` in the terminal.     
    
### Execution
    
To execute the code with a customer list, execute the following snippet in terminal while at the root directory of the 
repository.  

```  
rake run customer_list_directory  
```

Note: `customer_list_directory` would be the path to your customer list (i.e. `/user/lucas/customer_list.txt`)  
  
### Test  

To run the tests, execute the following snippet in terminal while at the root directory of the repository:  
 
```  
rake test  
```

## Implementation
  
I decided to use a gem that implements the Haversine formula to calculate the great-circle distance because of the 
ubiquity of the formula. I felt it would be unnecessary to write out new code executing the Haversine formula when its 
simplicity does not allow for much technical variation. 

I spent a good amount of time weighing the consequences of introducing an external gem to the "production" code. By 
locking in the version, I avoid any unexpected changes to the gem's functionality. I also read over the gem's source 
code to verify the effectiveness of the code.
