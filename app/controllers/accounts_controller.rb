class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
      @account = Account.find(params[:id])
      @transactions = Transaction.where(:contact_id => @account.account_owner)
      @transaction_fields = current_user.transaction_fields

      respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @account }
      end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
      @account = Account.new
      @account_owner = current_user.company.contacts

      respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @account }
      end
  end

  # GET /accounts/1/edit
  def edit
      @account = Account.find(params[:id])
      @account_owner = current_user.company.contacts
  end

  # POST /accounts
  # POST /accounts.json
  def create
      @account = Account.new(params[:account])
      @account_owner = current_user.company.contacts

      respond_to do |format|
          if @account.save
              format.html { redirect_to @account, notice: 'Account was successfully created.' }
              format.json { render json: @account, status: :created, location: @account }
          else
              format.html { render action: "new" }
              format.json { render json: @account.errors, status: :unprocessable_entity }
          end
      end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
      @account = Account.find(params[:id])
      @account_owner = current_user.company.contacts

      respond_to do |format|
          if @account.update_attributes(params[:account])
              format.html { redirect_to @account, notice: 'Account was successfully updated.' }
              format.json { head :no_content }
          else
              format.html { render action: "edit" }
              format.json { render json: @account.errors, status: :unprocessable_entity }
          end
      end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
      @account = Account.find(params[:id])
      @account.destroy

      respond_to do |format|
          format.html { redirect_to accounts_url }
          format.json { head :no_content }
      end
  end
end
