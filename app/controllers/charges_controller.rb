class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in kr
    @amount = 10000

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'sek'
    )

    after_customer_updated! do |customer, event|
     user = User.find_by_stripe_customer_id(customer.id)
       if charge.succeeded
         user.pro = true
         user.save!
       end
     end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
