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
6. 
