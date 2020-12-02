class AddRecordRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :record, foreign_key: true
  end
end
