# frozen_string_literal: true

require 'rails_helper'

class Validator
  include ActiveModel::Validations
  attr_accessor :date

  validates :date, future_date: true
end

describe FutureDateValidator do
  subject { Validator.new }

  context 'when due date is before current date' do
    before { subject.date = 1.day.ago }

    it 'should be invalid' do
      expect(subject.valid?).to be_falsey
    end

    it 'adds an error to the model' do
      subject.valid?
      expect(subject.errors.keys).to include(:date)
    end
  end

  context 'when due date is equal to current date' do
    before { subject.date = Time.zone.now }

    it 'should be invalid' do
      expect(subject.valid?).to be_falsey
    end

    it 'adds an error to the model' do
      subject.valid?
      expect(subject.errors.keys).to include(:date)
    end
  end

  context 'when due date is greater than current date' do
    before { subject.date = Time.zone.now + 1.day }

    it 'should be valid' do
      expect(subject.valid?).to be_truthy
    end
  end
end
