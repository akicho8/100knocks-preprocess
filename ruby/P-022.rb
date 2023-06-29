require "./setup"

_ Receipt.select(:customer_id).distinct.count
_ Receipt.distinct.count(:customer_id)
# >>   Receipt Count (68.3ms)  SELECT COUNT(DISTINCT `receipts`.`customer_id`) FROM `receipts`
# >> |------|
# >> | 8307 |
# >> |------|
# >>   Receipt Count (45.9ms)  SELECT COUNT(DISTINCT `receipts`.`customer_id`) FROM `receipts`
# >> |------|
# >> | 8307 |
# >> |------|
