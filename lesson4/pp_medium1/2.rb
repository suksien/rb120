class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# The mistake is at line 11, where rather than re-assigning the `@quantity` instance variable 
# to the passed in argument, we are initializing a local variable named `quantity`. To fix it, 
# there are 2 ways. 

# The first to access the instance variable directly: `@quantity = updated_count if updated_count >= 0`.

# The second is to change `attr_reader` to `attr_accessor` and invoke the getter method with 
# `self.quantity` in the problematic line. 