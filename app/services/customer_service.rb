class CustomerService
  def initialize(message)
    @message = message
  end

  def read_customers
    data = File.read("/assets/text_files/customer_list.txt")

  end
end