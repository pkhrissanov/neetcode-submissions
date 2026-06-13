-- Write your query below
select s.seller_name from seller s
left join 
(select seller_id from orders where EXTRACT(YEAR FROM sale_date) = 2020) o2020
on s.seller_id=o2020.seller_id
where o2020.seller_id is null
order by seller_name