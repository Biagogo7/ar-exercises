require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"


### Exercise 7: Validations for both models

# 1. Add validations to two models to enforce the following business rules:
#   * Employees must always have a first name present
#   * Employees must always have a last name present
#   * Employees have a hourly_rate that is a number (integer) between 40 and 200
#   * Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
#   * Stores must always have a name that is a minimum of 3 characters
#   * Stores have an annual_revenue that is a number (integer) that must be 0 or more
#   * BONUS: Stores must carry at least one of the men's or women's apparel 
#  (hint: use a [custom validation method](http://guides.rubyonrails.org/active_record_validations.html#custom-methods) - **don't** use a `Validator` class)
# 2. Ask the user for a store name (store it in a variable)
# 3. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
# 4. Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record



# Your code goes here ...


class Employee < ActiveRecord::Base
  validate :employees_must_always_have_first_name,
    :employees_must_always_have_last_name,
    :employees_hourly_rate_mustbe_integer,
    :employees_hourly_rate_integer_between_40_200,
    :employees_must_always_have_store
  

  def employees_must_always_have_first_name
    if first_name == null 
      errors.add(:first_name, "must have a first name" )
    end
  end

  def employees_must_always_have_last_name
    if last_name == null 
      errors.add(:last_name, "must have a last name" )
    end
  end

  def employees_hourly_rate_integer_between_40_200
    if hourly_rate < 40 || hourly_rate > 200 
      errors.add(:hourly_rate, "hourly rate must be between 40 and 200" )
    end
  end

  def employees_hourly_rate_mustbe_integer
    if hourly_rate.type != "integer" 
      errors.add(:hourly_rate, "hourly rate must be integer" )
    end
  end

  def employees_must_always_have_store
    if store == null 
      errors.add(:store, "must have a store" )
    end
  end

end




class Store < ActiveRecord::Base
  validate :store_must_always_have_name_with_more_than_3_xters,
    :store_annual_revenue_integer_more_than_zero
 
  def store_must_always_have_name_with_more_than_3_xters
    if name.length < 4 
      errors.add(:name, "store name must be more than 3 characters" )
    end
  end
  
  def store_annual_revenue_integer_more_than_zero
    if annual_revenue.type != integer && annual_revenue <= 0 
      errors.add(:annual_revenue, "annual_revenue be an integer and greater than 0" )
    end
  end
  
end



puts "Name of Store" 
store_name = $stdin.gets.chomp.to_i

stores = Store.create(name: store_name)









