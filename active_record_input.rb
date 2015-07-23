1) SELECT COUNT(*) FROM "users" => 249

2) Item.order(price: :desc).limit 5 D, [2015-06-05T13:50:38.207229 #6364] DEBUG -- : Item Load (0.4ms) SELECT "items".* FROM "items" ORDER BY "items"."price" DESC LIMIT 5 => [#, category: "Beauty">, #, category: "Jewelery & Beauty">, #, category: "Clothing, Health & Kids">, #, category: "Home">, #,

3) i=Item.where("category LIKE ?", "%Electronics%")

i.order(price: :asc).limit 1 D, [2015-06-05T14:12:41.140176 #6364] DEBUG -- : Item Load (0.3ms) SELECT "items".* FROM "items" WHERE (category LIKE '%Electronics%') ORDER BY "items"."price" ASC LIMIT 1 => [#, category: "Industrial, Outdoors & Electronics">]

4) Address.find(1)

Address.where(user_id: 1) D, [2015-06-05T15:09:44.615417 #6442] DEBUG -- : Address Load (0.2ms) SELECT "addresses".* FROM "addresses" WHERE "addresses"."user_id" = ? [["user_id", 1]] => [#]

5) n = Address.find(1)

n.zip = 10108

n => #

5) j=Item.where("category LIKE ?", "%jewelery%")

j.sum("price") D, [2015-06-05T14:36:25.465642 #6442] DEBUG -- : (0.2ms) SELECT SUM("items"."price") FROM "items" WHERE (category LIKE '%jewelery%') => #

6) Order.sum(:quantity) D, [2015-06-05T14:40:48.722195 #6442] DEBUG -- : (0.3ms) SELECT SUM("orders"."quantity") FROM "orders" => 6135

7) h=Item.where("category LIKE ?", "Health")

h.sum(:price) D, [2015-06-05T14:43:21.740736 #6442] DEBUG -- : (0.2ms) SELECT SUM("items"."price") FROM "items" WHERE (category LIKE 'Health') => #

8) pry(main)> User.find_or_create_by(first_name: 'Marky')

Order.find_or_create_by(user_id: 251, item_id:95, quantity:) D, [2015-06-05T14:51:26.688649 #6442] DEBUG -- : Order Load (0.3ms) SELECT "orders".* FROM "orders" WHERE "orders"."user_id" = ? AND "orders"."item_id" = ? AND "orders"."quantity" = ? LIMIT 1 [["user_id", 251], ["item_id", 95], ["quantity", 1]] D, [2015-06-05T14:51:26.689254 #6442] DEBUG -- : (0.1ms) begin transaction D, [2015-06-05T14:51:26.690746 #6442] DEBUG -- : SQL (0.9ms) INSERT INTO "orders" ("user_id", "item_id", "quantity") VALUES (?, ?, ?) [["user_id", 251], ["item_id", 95], ["quantity", 1]] D, [2015-06-05T14:51:26.693285 #6442] DEBUG -- : (2.1ms) commit transaction => #