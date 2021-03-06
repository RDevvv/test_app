class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :first_name
            t.string :last_name
            t.string :address
            t.integer :mobile_no, :limit => 8
            t.integer :account_type
            t.integer :company_id

            t.timestamps
        end

        add_index :users, :company_id
    end
end
