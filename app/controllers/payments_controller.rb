class PaymentsController < ApplicationController
  before_action :set_category
  before_action :authenticate_user!

  def index; end

  def new
    @current_user = current_user
    @payment = Payment.new
    @categories = current_user.categories
  end

  def create
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @payment = Payment.new(payment_params)
    @payment.user = @current_user
    @payment.category_id = @category.id

    if @payment.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @payment = Payment.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'payment deleted successfully' }
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
