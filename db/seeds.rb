User.create([
            {:first_name => "Admin", :last_name => "account", :address => "Near Vinchurkar diagnostics, CBS, Nashik", :mobile_no => 9876674554, :email => "admin@gmail.com", :password => "admin123", :password_confirmation => "admin123", :account_type => "1"},
            {:first_name => "Ramesh", :last_name => "Pawar", :address => "Pawan nagar, nashik", :mobile_no => 9973546324, :email => "team_leader@gmail.com", :password => "team_leader123", :password_confirmation => "team_leader123", :account_type => "2"},
            {:first_name => "Suresh", :last_name => "Kambale", :address => "Uttam nagar, Nashik", :mobile_no => 9912324212 , :email => "sales_executive1@gmail.com", :password => "sales_executive123", :password_confirmation => "sales_executive123", :account_type => "3"},
            {:first_name => "Ram", :last_name => "Patil", :address => "Panchavati, Nashik", :mobile_no => 9988776677 , :email => "sales_executive2@gmail.com", :password => "sales_executive1123", :password_confirmation => "sales_executive1123", :account_type => "3"},
            {:first_name => "Jitesh", :last_name => "Kulkarni", :address => "Mhasrul, Nashik", :mobile_no =>9932325434 , :email => "team_leader2@gmail.com", :password => "team_leader123", :password_confirmation => "team_leader123", :account_type => "2"},
            {:first_name => "Rahul", :last_name => "Borade", :address => "Upnagar, Nashik road", :mobile_no => 9878866856 , :email => "sales_executive3@gmail.com", :password => "sales_executive123", :password_confirmation => "sales_executive123", :account_type => "3"},
            {:first_name => "Praful", :last_name => "Bhamare", :address => "Near City center mall, Nashik", :mobile_no => 9912413213 , :email => "sales_executive4@gmail.com", :password => "sales_executive1123", :password_confirmation => "sales_executive1123", :account_type => "3"}
])

TeamLeader.create([
                  {:user_id => 2, :employee_id => 2},
                  {:user_id => 5, :employee_id => 5}
])

SalesExecutive.create([
                      {:team_leader_id =>1, :user_id =>3, :employee_id =>3},
                      {:team_leader_id =>1, :user_id =>4, :employee_id =>4},
                      {:team_leader_id =>2, :user_id =>6, :employee_id =>6},
                      {:team_leader_id =>2, :user_id =>7, :employee_id =>7}
])
