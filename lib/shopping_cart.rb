require './lib/product'

class ShoppingCart
    attr_reader :name, :capacity, :products

    def initialize(name, capacity)
        @name = name
        @capacity = capacity.delete("^0-9").to_i
        @products = []
    end

    def add_product(item)
        @products << item
    end

    def details
        {
        name: @name,
        capacity: @capacity 
        }
    end

    def total_number_of_products
       num_arr = @products.map do |product|
                 product.quantity
                 end
        num_arr.sum
    end

    def is_full?
        total_number_of_products >= @capacity
    end

    def products_by_category(category)
        @products.find_all do |product|
            product.category == category
        end
    end

    def percentage_occupied
        x = total_number_of_products.to_f / @capacity
        percentage = x * 100
        percentage.round(2)
    end

    def sorted_products_by_quantity
        @products.sort_by do |product|
            product.quantity
        end.reverse
    end

    def product_breakdown
        meat_array = products_by_category(:meat)
        paper_array = products_by_category(:paper)
        produce_array = products_by_category(:produce)

        {
            meat: meat_array,
            paper: paper_array,
            produce: produce_array
        }

    end

end