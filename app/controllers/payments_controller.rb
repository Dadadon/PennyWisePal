# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
    before_action :set_category
  
    def index
      @payments = @category.payments
    end
  
    def new
      @payment = @category.payments.new
    end
  
    def create
      @payment = @category.payments.new(payment_params)
      if @payment.save
        redirect_to category_payments_path(@category), notice: "Payment created successfully."
      else
        render :new
      end
    end
  
    private
  
    def set_category
      @category = Category.find(params[:category_id])
    end
  
    def payment_params
      params.require(:payment).permit(:name, :amount, category_ids: [])
    end
  end
  