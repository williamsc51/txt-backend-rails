# frozen_string_literal: true
 require_relative '../../../../config/initializers/paypal.rb'
 require 'paypal-sdk-rest'
 include PayPalCheckoutSdk::Orders

# API class
class Api::V1::PurchaseController < ApiController
      
      def index
        @purchase = Purchase.all
        render json: @purchase
      end

      def create_order debug=true

        body = purchase_params.to_hash
    
        request = OrdersCreateRequest::new
        request.prefer("return=representation")
        request.request_body(body)
        #3. Call PayPal to set up a transaction
        @response = PayPalClient::client.execute(request)
        if debug
          puts "Status Code: " + @response.status_code.to_s
          puts "Status: " + @response.result.status
          puts "Order ID: " + @response.result.id
          puts "Intent: " + @response.result.intent
          puts "Links:"
          for link in @response.result.links
          # This could also be named link.rel or link.href, but method is a reserved keyword for Ruby. Avoid using link.method.
          puts "\t#{link["rel"]}: #{link["href"]}\tCall Type: #{link["method"]}"
          end
          puts "Gross Amount: " + @response.result.purchase_units[0].amount.currency_code + @response.result.purchase_units[0].amount.value
          puts PayPalClient::openstruct_to_hash(@response.result).to_json
        end
        
        # return response

        if @response.result.status == "CREATED"
          @results = PayPalClient::openstruct_to_hash(@response.result).to_json
          render json: @results
        else 
          puts 'Erorr'
        end
      end

      def capture_order debug=true
        order_id = params[:oID][:orderID]
        request = OrdersCaptureRequest::new(order_id)
        request.prefer("return=representation")
        #3. Call PayPal to capture an order
        begin
          response = PayPalClient::client.execute(request)
          #4. Save the capture ID to your database. Implement logic to save capture to your database for future reference.
          user = 1
          ppID = response.result.id
          @purchase = Purchase.new
          @purchase.paypay_orderID = ppID
          @purchase.user_id = user
          @purchase.save
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
              puts "\t #{capture.id}"
            end
          end
          puts "Buyer:"
          buyer = response.result.payer
          puts "\tEmail Address: #{buyer.email_address}\n\tName: #{buyer.name.given_name}"
          puts PayPalClient::openstruct_to_hash(response.result).to_json
        end

            results = PayPalClient::openstruct_to_hash(response.result).to_json
            render json: results
      end

      private

      def purchase_params
        params.require(:purchase).permit(:intent, :purchase_units =>[:amount=> [:currency_code,:value]])
      end
end

