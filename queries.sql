1. select month , upi_volume_lakh
from rbi_payments 
order by upi_volume_lakh desc;
2. select avg(upi_value_crores) as avg_spent 
from rbi_payments; 
3. select right(month ,2) as year, count(*) as months_above_350, avg(atm_withdrawal_volume_lakh) as avg_atm_volume 
from rbi_payments
where atm_withdrawal_volume_lakh > 350 
group by right(month ,2)
order by avg_atm_volume desc;  
4. select 
     sum(upi_value_crores) as total_upi,               
     sum(neft_value_crores) as total_neft, 
     sum(imps_value_crores) as total_imps
from rbi_payments; 
5. select month, upi_value_crores, atm_withdrawal_value_crores 
from rbi_payments
order by upi_value_crores desc;  
6. select month, credit_card_value_crores 
from rbi_payments
order by credit_card_value_crores desc; 
7. select 
    sum(credit_card_value_crores) as total_credit_card_value,
    sum(debit_card_value_crores) as total_debit_card_value,
    sum(credit_card_value_crores) - SUM(debit_card_value_crores) as difference
from rbi_payments;
8. select month, upi_volume_lakh, neft_volume_lakh 
from rbi_payments 
where upi_volume_lakh > 2* neft_volume_lakh 
order by month desc;  
9. select month , upi_volume_lakh,
      case 
          when upi_volume_lakh > 150000 then 'high'
          when upi_volume_lakh >= 50000 then 'medium'
          else 'low'
          end as upi_label 
          from rbi_payments
          order by month desc; 
10. with avg_upi as (
  select  AVG(upi_value_crores) as average_upi_value
    from rbi_payments
),
above_average as (
    select 
        month,
        upi_value_crores
    from rbi_payments 
    cross join avg_upi
    where  upi_value_crores > average_upi_value
)
select 
    month,
    upi_value_crores,
    count(*) OVER () as months_above_average
from  above_average;

