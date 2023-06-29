require "./setup"

columns = [:sales_ymd, :customer_id, :product_cd, :quantity, :amount]
or_cond = Receipt.where(Receipt.arel_table[:amount].gteq(1000))
or_cond = or_cond.or(Receipt.where(Receipt.arel_table[:quantity].gteq(5)))
_ Receipt.select(columns)
  .where(customer_id: "CS018205000001")
  .merge(or_cond)
# >>   Receipt Load (58.9ms)  SELECT `receipts`.`sales_ymd`, `receipts`.`customer_id`, `receipts`.`product_cd`, `receipts`.`quantity`, `receipts`.`amount` FROM `receipts` WHERE `receipts`.`customer_id` = 'CS018205000001' AND (`receipts`.`amount` >= 1000 OR `receipts`.`quantity` >= 5)
# >> |-----------+----------------+------------+----------+--------+----|
# >> | sales_ymd | customer_id    | product_cd | quantity | amount | id |
# >> |-----------+----------------+------------+----------+--------+----|
# >> |  20180911 | CS018205000001 | P071401012 |        1 |   2200 |    |
# >> |  20180414 | CS018205000001 | P060104007 |        6 |    600 |    |
# >> |  20170614 | CS018205000001 | P050206001 |        5 |    990 |    |
# >> |  20190226 | CS018205000001 | P071401020 |        1 |   2200 |    |
# >> |  20180911 | CS018205000001 | P071401005 |        1 |   1100 |    |
# >> |-----------+----------------+------------+----------+--------+----|
