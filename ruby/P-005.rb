require "./setup"

columns = [:sales_ymd, :customer_id, :product_cd, :amount]
_ Receipt.select(columns)
  .where(customer_id: "CS018205000001")
  .where(Receipt.arel_table[:amount].gteq(1000))
# >>   Receipt Load (46.1ms)  SELECT `receipts`.`sales_ymd`, `receipts`.`customer_id`, `receipts`.`product_cd`, `receipts`.`amount` FROM `receipts` WHERE `receipts`.`customer_id` = 'CS018205000001' AND `receipts`.`amount` >= 1000
# >> |-----------+----------------+------------+--------+----|
# >> | sales_ymd | customer_id    | product_cd | amount | id |
# >> |-----------+----------------+------------+--------+----|
# >> |  20180911 | CS018205000001 | P071401012 |   2200 |    |
# >> |  20190226 | CS018205000001 | P071401020 |   2200 |    |
# >> |  20180911 | CS018205000001 | P071401005 |   1100 |    |
# >> |-----------+----------------+------------+--------+----|
