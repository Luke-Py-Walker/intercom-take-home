# frozen_string_literal: true

require_relative '../lib/close_customers_finder'

describe '#customers_within' do
  let (:from_lat) { 37.788802 }
  let (:from_long) { -122.4025067 }
  context 'multiple customers valid customers' do
    it 'returns valid customers in order' do
      expect(CloseCustomersFinder.find_close_customers('spec/data/test_customer_list.txt'))
        .to eq [{ 'user_id' => '1', 'name' => 'valid user' },
                { 'user_id' => '6', 'name' => 'valid user 2' },
                { 'user_id' => '7', 'name' => 'valid user 3' }]
    end
  end
end
