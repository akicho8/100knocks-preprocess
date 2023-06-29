require "./setup"

columns = [:id, :sales_ymd, :customer_id, :product_cd, :amount]
_ Receipt.select(columns)
  .where(customer_id: "CS018205000001")
  .where(amount: 1000..2000)
# >>   Receipt Load (58.7ms)  SELECT `receipts`.`id`, `receipts`.`sales_ymd`, `receipts`.`customer_id`, `receipts`.`product_cd`, `receipts`.`amount` FROM `receipts` WHERE `receipts`.`customer_id` = 'CS018205000001' AND `receipts`.`amount` BETWEEN 1000 AND 2000
# >> |-------+-----------+----------------+------------+--------|
# >> | id    | sales_ymd | customer_id    | product_cd | amount |
# >> |-------+-----------+----------------+------------+--------|
# >> | 72255 |  20180911 | CS018205000001 | P071401005 |   1100 |
# >> |-------+-----------+----------------+------------+--------|
