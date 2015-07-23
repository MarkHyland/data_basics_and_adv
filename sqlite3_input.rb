1)  
sqlite> select count(*) from users;

49



2)  
sqlite> select name from items order by price desc limit 5

name
----------------------
Gorgeous Plastic Pants
Intelligent Cotton Com
Small Concrete Pants
Gorgeous Granite Pants
Rustic Concrete Pants



3)
sqlite> select name from items where category = "Electronics" order by price asc limit 1;

name
-------------------
Rustic Wooden Table



4)
sqlite> select * from addresses JOIN users on users.id = addresses.user_id WHERE street ="489 Fritsch Island";

id          user_id     street              city         state       zip         id          first_name  last_name   email
----------  ----------  ------------------  -----------  ----------  ----------  ----------  ----------  ----------  ----------------------------
38          35          489 Fritsch Island  New Jessyca  California  10586       35          Marty       Schmidt     jimmy.watsica@purdykiehn.net


sqlite> select * from addresses where user_id ="35"

id          user_id     street               city            state       zip
----------  ----------  -------------------  --------------  ----------  ----------
37          35          84642 Bosco Orchard  East Devanland  Maryland    97375
38          35          489 Fritsch Island   New Jessyca     California  10586



5)
sqlite> select * from addresses JOIN users on users.id = addresses.user_id WHERE first_name = "Tevin" AND last_name = "Mitchell"

id          user_id     street               city         state       zip         id          first_name  last_name   email
----------  ----------  -------------------  -----------  ----------  ----------  ----------  ----------  ----------  ----------------------------
26          25          42939 Stefan Skyway  East Nedton  New York    92202       25          Tevin       Mitchell    susanna_ondricka@miller.name
27          25          354 Johnston Ramp    Daughertych  Indiana     18361       25          Tevin       Mitchell    susanna_ondricka@miller.name


sqlite> update addresses SET zip = 10108 where id = 26;
sqlite> select * from addresses where id = 26

id          user_id     street               city         state       zip
----------  ----------  -------------------  -----------  ----------  ----------
26          25          42939 Stefan Skyway  East Nedton  New York    10108



6)
sqlite> select sum(price) from items where category = "Jewelery";

sum(price)
----------
78.58



7)
sqlite> select sum(quantity) from orders;

sum(quantity)
-------------
817



8)
sqlite> select sum(price*quantity) from orders JOIN items on orders.item_id = items.id WHERE category = "Health";

sum(price*quantity)
-------------------
1796.2



9)
sqlite> INSERT INTO users VALUES (99999,"Mark","Hyland","markdhyland@gmail.com")
sqlite> INSERT INTO orders VALUES (null,99999,40,1)
sqlite> select * from users JOIN orders on user_id = orders.user_id WHERE user_id = 99999;

id          first_name  last_name   email               id          user_id     item_id     quantity
----------  ----------  ----------  ------------------  ----------  ----------  ----------  ----------
99999       Mark        Hyland      markdhyland@gmail.  150         99999       40          1