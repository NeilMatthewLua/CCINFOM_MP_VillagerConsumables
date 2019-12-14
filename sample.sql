
SELECT		MONTH(o.order_date) ,COUNT(o.status)
FROM 		orders o
WHERE		o.status = 'D' AND YEAR(o.order_date) = '1989'
ORDER BY 	o.status, MONTH(o.order_date);

SELECT		MONTH(o.order_date) ,COUNT(o.status)
FROM 		orders o
WHERE		o.status = 'C'AND YEAR(o.order_date) = '1989'
ORDER BY 	o.status, MONTH(o.order_date);

SELECT		MONTH(o.order_date), SUM(pd.amount_paid)
FROM 		orders o
	JOIN		payment_details pd
	ON 			pd.orderID = o.orderID
WHERE		o.status = 'C'AND YEAR(o.order_date) = '1989'
ORDER BY 	o.status, MONTH(o.order_date);
