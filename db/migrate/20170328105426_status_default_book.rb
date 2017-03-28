class StatusDefaultBook < ActiveRecord::Migration[5.0]
  def change
    change_column_default :books, :status, 0
  end
end
