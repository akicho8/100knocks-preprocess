require "./setup"

_ Receipt.first(N)
# >>   Receipt Load (0.3ms)  SELECT `receipts`.* FROM `receipts` ORDER BY `receipts`.`id` ASC LIMIT 10
# >> |----+-----------+-------------+----------+------------+----------------+----------------+------------+----------+--------|
# >> | id | sales_ymd | sales_epoch | store_cd | receipt_no | receipt_sub_no | customer_id    | product_cd | quantity | amount |
# >> |----+-----------+-------------+----------+------------+----------------+----------------+------------+----------+--------|
# >> |  1 |  20181103 |  1541203200 | S14006   |        112 |              1 | CS006214000001 | P070305012 |        1 |    158 |
# >> |  2 |  20181118 |  1542499200 | S13008   |       1132 |              2 | CS008415000097 | P070701017 |        1 |     81 |
# >> |  3 |  20170712 |  1499817600 | S14028   |       1102 |              1 | CS028414000014 | P060101005 |        1 |    170 |
# >> |  4 |  20190205 |  1549324800 | S14042   |       1132 |              1 | ZZ000000000000 | P050301001 |        1 |     25 |
# >> |  5 |  20180821 |  1534809600 | S14025   |       1102 |              2 | CS025415000050 | P060102007 |        1 |     90 |
# >> |  6 |  20190605 |  1559692800 | S13003   |       1112 |              1 | CS003515000195 | P050102002 |        1 |    138 |
# >> |  7 |  20181205 |  1543968000 | S14024   |       1102 |              2 | CS024514000042 | P080101005 |        1 |     30 |
# >> |  8 |  20190922 |  1569110400 | S14040   |       1102 |              1 | CS040415000178 | P070501004 |        1 |    128 |
# >> |  9 |  20170504 |  1493856000 | S13020   |       1112 |              2 | ZZ000000000000 | P071302010 |        1 |    770 |
# >> | 10 |  20191010 |  1570665600 | S14027   |       1102 |              1 | CS027514000015 | P071101003 |        1 |    680 |
# >> |----+-----------+-------------+----------+------------+----------------+----------------+------------+----------+--------|
