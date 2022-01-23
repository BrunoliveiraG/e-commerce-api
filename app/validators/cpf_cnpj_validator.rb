# frozen_string_literal: true

require 'cpf_cnpj'

class CpfCnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?

    record.errors.add(attribute, :invalid_cpf_cnpj) unless CPF.valid?(value) || CNPJ.valid?(value)
  end
end
