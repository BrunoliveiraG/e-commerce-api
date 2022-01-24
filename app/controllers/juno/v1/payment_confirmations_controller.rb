module Juno::V1
  class PaymentConfirmationsController < ApplicationController
    include StaticTokenAuthenticatable

    def create
      puts "teste2"
      puts params
      puts "teste4"
      puts :chargeCode
      puts "teste3"
      puts params.has_key?(:chargeCode)
      if params.has_key?(:chargeCode)
        Juno::Charge.find_by(code: params[:chargeCode])&.order&.update(status: :payment_accepted)
        puts "teste1"
      end
      head :ok
    end
  end
end