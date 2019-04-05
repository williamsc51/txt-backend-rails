class Api::V1::PurchaseController < ApiController

  def index
    @name = "Courtney"
    render json: Stripe::Charge.list(limit: 3)
  end
  
  def create
        # Amount in cents
        @amount = (params[:amount].to_f * 100).to_i
      
        customer = Stripe::Customer.create({
          email: params[:email],
          source: params[:id],
        })
      
        charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @amount,
          description: 'Rails Stripe customer',
          currency: 'usd',
        })
    end
      
end
