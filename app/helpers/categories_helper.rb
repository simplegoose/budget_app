module CategoriesHelper
  def get_transaction_total(transactions)
    transactions.reduce(0) { |sum, transaction| sum + transaction.amount }
  end
end
