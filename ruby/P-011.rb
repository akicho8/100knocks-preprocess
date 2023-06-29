require "./setup"

_ Customer.where(["customer_id LIKE ?", "%1"]).limit(N)
# >>   Customer Load (0.7ms)  SELECT `customers`.* FROM `customers` WHERE (customer_id LIKE '%1') LIMIT 10
# >> |-----+----------------+---------------+-----------+--------+------------+-----+-----------+--------------------------------------+----------------------+------------------+--------------|
# >> | id  | customer_id    | customer_name | gender_cd | gender | birth_day  | age | postal_cd | address                              | application_store_cd | application_date | status_cd    |
# >> |-----+----------------+---------------+-----------+--------+------------+-----+-----------+--------------------------------------+----------------------+------------------+--------------|
# >> |   2 | CS037613000071 | 六角 雅彦     |         9 | 不明   | 1952-04-01 |  66 | 136-0076  | 東京都江東区南砂**********           | S13037               |         20150414 | 0-00000000-0 |
# >> |   4 | CS028811000001 | 堀井 かおり   |         1 | 女性   | 1933-03-27 |  86 | 245-0016  | 神奈川県横浜市泉区和泉町**********   | S14028               |         20160115 | 0-00000000-0 |
# >> |  15 | CS040412000191 | 川井 郁恵     |         1 | 女性   | 1977-01-05 |  42 | 226-0021  | 神奈川県横浜市緑区北八朔町********** | S14040               |         20151101 | 1-20091025-4 |
# >> |  32 | CS028314000011 | 小菅 あおい   |         1 | 女性   | 1983-11-26 |  35 | 246-0038  | 神奈川県横浜市瀬谷区宮沢**********   | S14028               |         20151123 | 1-20080426-5 |
# >> |  57 | CS039212000051 | 藤島 恵梨香   |         1 | 女性   | 1997-02-03 |  22 | 166-0001  | 東京都杉並区阿佐谷北**********       | S13039               |         20171121 | 1-20100215-4 |
# >> |  60 | CS015412000111 | 松居 奈月     |         1 | 女性   | 1972-10-04 |  46 | 136-0071  | 東京都江東区亀戸**********           | S13015               |         20150629 | 0-00000000-0 |
# >> |  64 | CS004702000041 | 野島 洋       |         0 | 男性   | 1943-08-24 |  75 | 176-0022  | 東京都練馬区向山**********           | S13004               |         20170218 | 0-00000000-0 |
# >> |  75 | CS041515000001 | 栗田 千夏     |         1 | 女性   | 1967-01-02 |  52 | 206-0001  | 東京都多摩市和田**********           | S13041               |         20160422 | E-20100803-F |
# >> |  86 | CS029313000221 | 北条 ひかり   |         1 | 女性   | 1987-06-19 |  31 | 279-0011  | 千葉県浦安市美浜**********           | S12029               |         20180810 | 0-00000000-0 |
# >> | 103 | CS034312000071 | 望月 奈央     |         1 | 女性   | 1980-09-20 |  38 | 213-0026  | 神奈川県川崎市高津区久末**********   | S14034               |         20160106 | 0-00000000-0 |
# >> |-----+----------------+---------------+-----------+--------+------------+-----+-----------+--------------------------------------+----------------------+------------------+--------------|