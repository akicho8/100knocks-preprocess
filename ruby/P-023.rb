require "./setup"

_ Receipt.select(["store_cd", "SUM(amount)", "SUM(quantity)"]).group(:store_cd).order(:store_cd).limit(T)
# >>   Receipt Load (71.5ms)  SELECT `receipts`.`store_cd`, SUM(amount), SUM(quantity) FROM `receipts` GROUP BY `receipts`.`store_cd` ORDER BY `receipts`.`store_cd` ASC LIMIT 3
# >> |----------+-------------+---------------+----|
# >> | store_cd | SUM(amount) | SUM(quantity) | id |
# >> |----------+-------------+---------------+----|
# >> | S12007   |      638761 |          2099 |    |
# >> | S12013   |      787513 |          2425 |    |
# >> | S12014   |      725167 |          2358 |    |
# >> |----------+-------------+---------------+----|
