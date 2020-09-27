class CustomerService

  def read_customers
    customers = []
    customer_data = File.read("app/assets/text_files/customer_list.txt")
    customer_data = customer_data.split(/\n+/)

    customer_data.each do |data|
      customer_poro = JSON.parse(data, object_class: OpenStruct)

      customer = Customer.find_or_create_by(id: customer_poro.user_id)
      customer.update(
          longitude: customer_poro.longitude,
          latitude: customer_poro.latitude,
          name: customer_poro.name
      )

      customers << customer
    end

    customers
  end

  def print_customers_to_file(customers)
    File.write('app/assets/text_files/customers_within_100_km.txt', customers.pluck(:id, :name).map(&:to_s).join("\n"))
  end

end