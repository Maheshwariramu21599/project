class Addaddressreferencetoplayer < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :address, foreign_key: true
  end
end
