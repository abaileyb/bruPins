class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :boards, :pins do |t|
      # t.index [:board_id, :pin_id]
      # t.index [:pin_id, :board_id]
    end
  end
end
