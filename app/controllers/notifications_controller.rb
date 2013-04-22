class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  filter_access_to :all
  layout :choose_layout

  def choose_layout
      if action_name == 'search'
          false
      else
          'application'
      end
  end
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
    @notifications = Notification.paginate(:page => params[:page], :per_page => 15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notifications }
    end
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    @notification = Notification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notification }
    end
  end

  # GET /notifications/new
  # GET /notifications/new.json
  def new
    @notification = Notification.new
    @contacts = Contact.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notification }
    end
  end

  # GET /notifications/1/edit
  def edit
    @notification = Notification.find(params[:id])
    @contacts = Contact.all
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(params[:notification])
    @notification2 = Notification.new(params[:notification])
    @notification2.notification_time = @notification2.notification_time + params[:Next_Notification].to_i.month
      if @notification.save
         @notification2.save
        format.html { redirect_to :notifications, notice: 'Notification was successfully created.' }
        format.json { render json: @notification, status: :created, location: @notification }
      else
        format.html { render action: "new" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end

  # PUT /notifications/1
  # PUT /notifications/1.json
  def update
    @notification = Notification.find(params[:id])

    respond_to do |format|
      if @notification.update_attributes(params[:notification])
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end

  def noticed
      respond_to do |format|
          format.html
          format.json { render json: @notification }
      end
  end

  def search
      if current_user.account_type == 1
          unless params[:q].empty?
              @notifications = Notification.where("body like \'%#{params[:q]}%\'")
          else
              @notifications = Notification.all
          end
      end
      respond_to do |format|
          format.html
          format.json { head :no_content }
      end
  end
end
