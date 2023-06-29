require "./setup"

ranking = %(RANK() OVER (ORDER BY amount DESC) as "ranking")
_ Receipt
  .select([:id, :customer_id, :amount, ranking])
  .order(amount: :desc)
  .limit(N)
# >>   Receipt Load (140.5ms)  SELECT `receipts`.`id`, `receipts`.`customer_id`, `receipts`.`amount`, RANK() OVER (ORDER BY amount DESC) as "ranking" FROM `receipts` ORDER BY `receipts`.`amount` DESC LIMIT 10
# >> |-------+----------------+--------+---------|
# >> | id    | customer_id    | amount | ranking |
# >> |-------+----------------+--------+---------|
# >> |  1203 | CS011415000006 |  10925 |       1 |
# >> | 62318 | ZZ000000000000 |   6800 |       2 |
# >> | 54096 | CS028605000002 |   5780 |       3 |
# >> |  4633 | CS015515000034 |   5480 |       4 |
# >> | 10321 | ZZ000000000000 |   5480 |       4 |
# >> | 72748 | ZZ000000000000 |   5480 |       4 |
# >> | 97295 | CS021515000089 |   5440 |       7 |
# >> | 28305 | ZZ000000000000 |   5440 |       7 |
# >> | 20755 | ZZ000000000000 |   5280 |       9 |
# >> | 21848 | CS035615000040 |   5280 |       9 |
# >> |-------+----------------+--------+---------|
