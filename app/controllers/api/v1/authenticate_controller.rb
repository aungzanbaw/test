module Api
  module V1
    class AuthenticateController < ApplicationController
      before_action :authenticate, except: [:login]
      protect_from_forgery with: :null_session
      # protect_from_forgery with: :exception

      def login
        customer = Customer.find_by(phone: params[:phone], password: params[:password])
        if customer.nil?
          render status: 401, json: {status: "Bad credentials"}
        else
          render_unauthorized if customer.auth_token.nil?
          render status: 200, json: {
            status: "Authorized",
            customer: customer
          }
        end
      end

      def orders
        orders = Order.where(customer_id: @customer).order('created_at DESC').limit(20)
        render status: 200, json: orders.as_json(include: [:details])
      end

      def order
        @order = Order.new(order_params)
        @order.customer_id = @customer.id
        @order.status = true
        if @order.save
          params.require(:details).each do |d|
            d_permitted = d.permit(:name, :qty, :price, :remark)
	    unless d_permitted[:name] == "" && d_permitted[:qty] == "" && d_permitted[:price]
            	@detail = Detail.new
            	@detail.order_id = @order.id
            	@detail.name = d_permitted[:name]
            	@detail.qty = d_permitted[:qty]
	    	@detail.price = d_permitted[:price]
            	@detail.save
	    end
          end
          render status: 200, json: {status: 'ok'}
        else
          render status: 500, json: {status: 'error'}
        end
      end

      protected
        def authenticate
          authenticate_token || render_unauthorized
        end

        def authenticate_token
          authenticate_with_http_token do |token, options|
            @customer = Customer.find_by(auth_token: token)
          end
        end

        def render_unauthorized
          self.headers['WWW-Authenticate'] = 'Token realm="Application"'
          render status: 401, json: 'Bad credentials'
        end

        def order_params
          params.require(:order).permit(:customer_id, :delivery, :gate, :remark, :payment, :status, :department_id, :details)
        end

        def detail_params
          params.require(:details).permit(:name, :qty, :price)
        end
    end
  end
end
