# frozen_string_literal: true

# require_relative '../../../../paypal_config'

# API class
module Api
  module V1
    class PurchaseController < ApiController

      include PayPalCheckoutSdk::Orders

      def index
        @payments = 'ManHimSelf'
        render json: @payments
      end

      def create debug=true
        body = {
          intent: "CAPTURE",
          purchase_units: [{
            amount: {
              currency_code: "USD",
              value: "100.00"
            },
            payee: {
              email_address: "seller@example.com"
            },
            payment_instruction: {
              disbursement_mode: "INSTANT",
              platform_fees: [{
                amount: {
                  currency_code: "USD",
                  value: "25.00"
                },
                payee: {
                  "email_address": "seller@example.com"
                }
              }]
            }
          }]
        }

        request = OrdersCreateRequest.new
        request.prefer('return=representation')
        request.request_body(body)
        begin
        # Call PayPal to set up a transaction
        response = PayPalClient.client.execute(request)
        if debug
          puts "Status Code: " + response.status_code.to_s
          puts "Status: " + response.result.status
          puts "Order ID: " + response.result.id
          puts "Intent: " + response.result.intent
          puts "Links:"
          for link in response.result.links
          # This could also be named link.rel or link.href, but method is a reserved keyword for Ruby. Avoid using link.method.
          puts "\t#{link["rel"]}: #{link["href"]}\tCall Type: #{link["method"]}"
          end
          puts "Gross Amount: " + response.result.purchase_units[0].amount.currency_code + response.result.purchase_units[0].amount.value
        end
        render json: response
        return response
        end
      end


      def capture_order(order_id) debug=false
        request = OrdersCaptureRequest::new(order_id)
        request.prefer("return=representation")
        #3. Call PayPal to capture an order
        begin
          response = PayPalClient::client.execute(request)
          #4. Save the capture ID to your database. Implement logic to save capture to your database for future reference.
        rescue => e
          puts e.result
          #5. Handle errors, if any.
        end
        if debug
          puts "Status Code: " + response.status_code.to_s
          puts "Status: " + response.result.status
          puts "Order ID: " + response.result.id
          puts "Intent: " + response.result.intent
          puts "Links:"
          for link in response.result.links
          # This could also be named link.rel or link.href, but method is a reserved keyword for Ruby. Avoid using link.method.
          puts "\t#{link["rel"]}: #{link["href"]}\tCall Type: #{link["method"]}"
          end
          puts "Capture Ids: "
          for purchase_unit in response.result.purchase_units
            for capture in purchase_unit.payments.captures
              puts "\t #"
            end
          end
          puts "Buyer:"
          buyer = response.result.payer
          puts "\tEmail Address: #\n\tName: #\n\tPhone Number: #"
        end
        return response
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # Only allow a trusted parameter "white list" through.
  def purchase_params
    params.require(:purchase).permit(:type, attributes:[ :intent, :purchase_unit ] )
  end

end
