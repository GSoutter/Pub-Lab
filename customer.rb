class Customer

  attr_reader :name, :wallet
  attr_writer :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end



end
