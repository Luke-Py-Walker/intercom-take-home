# frozen_string_literal: true

require 'haversine'

module CloseCustomersFinder

  OFFICE_LAT = 37.788802
  OFFICE_LONG = -122.4025067

  def self.find_close_customers(customer_list)
    close_customers = []
    File.foreach(customer_list) do |line|
      customer_data = parse(line)
      if %w[user_id latitude longitude name].all? { |key| customer_data.key? key }
        next unless convert_coordinates_to_float(customer_data)

        if Haversine.distance(OFFICE_LAT, OFFICE_LONG, customer_data['latitude'], customer_data['longitude']) <= 100
          close_customers.append('user_id' => customer_data['user_id'], 'name' => customer_data['name'])
        end
      end
    end
    close_customers.sort_by { |close_customer| close_customer['user_id'].to_i }
  end

  private

  def self.parse(line)
    json_attributes = line.strip[1..-3].split(',')
    convert_to_hash(json_attributes)
  end

  def self.convert_to_hash(json_attributes)
    json_attributes.each_with_object({}) do |attribute, hash|
      key_value_pair = attribute.split(':')
      key = key_value_pair[0].strip
      value = key_value_pair[1].strip
      value.gsub!(/\A"|"\Z/, '')
      hash[key] = value
    end
  end

  def self.convert_coordinates_to_float(customer_data)
    if valid_float?(customer_data['latitude']) && valid_float?(customer_data['longitude'])
      customer_data['latitude'] = customer_data['latitude'].to_f
      customer_data['longitude'] = customer_data['longitude'].to_f
    else
      false
    end
  end

  def self.valid_float?(str)
    !!Float(str) rescue false
  end
end
