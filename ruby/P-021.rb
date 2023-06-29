require "./setup"

_ Receipt.count
# >>   Receipt Count (13.3ms)  SELECT COUNT(*) FROM `receipts`
# >> |--------|
# >> | 104681 |
# >> |--------|
