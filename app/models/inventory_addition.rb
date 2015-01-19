class InventoryAddition < ActiveRecord::Base
    include PublicActivity::Model
    tracked owner: ->(controller, model) {controller && controller.current_user}

    belongs_to :product

    attr_accessible :addition_date, :product_id, :quantity, :company_id, :inventory_id, :update_product_id, :update_difference
    attr_accessor :update_product_id, :update_difference

    validates :product_id, :presence => true
    validates :quantity, :presence => true
    validates :addition_date, :presence => true

    after_update :update_inventory
    after_create :create_inventory

    def update_inventory
        @product = Product.find(self.product_id)
        @product.update_attributes(:quantity => @product.quantity + self.update_difference)
    end

    def create_inventory
        @product = Product.find(self.product_id)
        @product.update_attributes(:quantity => @product.quantity + self.quantity)
    end
end
