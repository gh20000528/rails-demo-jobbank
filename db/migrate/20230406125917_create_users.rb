class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nicknaem
      t.date :birthday
      t.integer :role,defaul:1
      # 1: user, 2: company, 3: staff
      t.integer :gender,defaul:0
      # 0: 不公開, 1: 男, 2: 女, 3: 其它

      t.timestamps
    end
  end
end
