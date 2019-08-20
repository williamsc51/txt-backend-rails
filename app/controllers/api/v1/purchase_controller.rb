# frozen_string_literal: true
 require_relative '../../../../config/initializers/paypal.rb'
 require 'paypal-sdk-rest'
 include PayPalCheckoutSdk::Orders

# API class
class Api::V1::PurchaseController < ApiController
      
      def index
        # @payments = 'ManHimSelf'
        # render json: @payments
        @res = PayPal::SDK::REST::DataTypes::Invoice.get_all(:total_count_required => true)
        # render json: res
        # headers = {
        #   'Content-Type': 'application/json', 
        #   'Authorization': '#'
        # }
        # inParams = {
        #   'total_required': true
        # }
        # path = 'https://api.sandbox.paypal.com/v2/invoicing/invoices'

        # res = HTTParty.get(path, headers: headers, query: inParams)

        # render json: res

        render html: res
      end

      def create_order debug=true
        body = {
          intent: 'CAPTURE',
          application_context: {
            brand_name: 'EXAMPLE INC',
            landing_page: 'BILLING',
            shipping_preference: 'SET_PROVIDED_ADDRESS',
            user_action: 'CONTINUE'
          },
          purchase_units: [
            {
              reference_id: 'PUHF',
              description: 'Sporting Goods',
    
              custom_id: 'CUST-HighFashions',
              soft_descriptor: 'HighFashions',
              amount: {
                currency_code: 'USD',
                value: '230.00',
                breakdown: {
                  item_total: {
                    currency_code: 'USD',
                    value: '180.00'
                  },
                  shipping: {
                    currency_code: 'USD',
                    value: '30.00'
                  },
                  handling: {
                    currency_code: 'USD',
                    value: '10.00'
                  },
                  tax_total: {
                    currency_code: 'USD',
                    value: '20.00'
                  },
                  shipping_discount: {
                    currency_code: 'USD',
                    value: '10'
                  }
                }
              },
              items: [
                {
                  name: 'T-Shirt',
                  description: 'Green XL',
                  sku: 'sku01',
                  unit_amount: {
                    currency_code: 'USD',
                    value: '90.00'
                  },
                  tax: {
                    currency_code: 'USD',
                    value: '10.00'
                  },
                  quantity: '1',
                  category: 'PHYSICAL_GOODS'
                },
                {
                  name: 'Shoes',
                  description: 'Running, Size 10.5',
                  sku: 'sku02',
                  unit_amount: {
                    currency_code: 'USD',
                    value: '45.00'
                  },
                  tax: {
                    currency_code: 'USD',
                    value: '5.00'
                  },
                  quantity: '2',
                  category: 'PHYSICAL_GOODS'
                }
              ],
              shipping: {
                method: 'United States Postal Service',
                address: {
                  name: {
                    full_name: 'John',
                    surname: 'Doe'
                  },
                  address_line_1: '123 Townsend St',
                  address_line_2: 'Floor 6',
                  admin_area_2: 'San Francisco',
                  admin_area_1: 'CA',
                  postal_code: '94107',
                  country_code: 'US'
                }
              }
            }
          ]
        }
    
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
        params.require(:purchase).permit(:intent, :value)
      end
end

