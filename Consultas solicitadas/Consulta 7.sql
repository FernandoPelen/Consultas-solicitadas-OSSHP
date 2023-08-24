-- Monto de los pagos recibidos el dia 14/02/2004 y nombre de la persona que lo recibió.
-- Se cambio la fecha de pago de 4 campos para que coincidiera con la fecha solicitda
UPDATE payment SET payment_date = '2004-02-14 11:30:37' WHERE payment_id IN (3, 10);
UPDATE payment SET payment_date = '2004-02-14 15:23:01' WHERE payment_id IN (23, 34);
SELECT
	SUM(amount) AS Total
	, p.amount AS pago_establecido
    , st.first_name AS nomnre_empleado
    FROM 
    payment p 
    INNER JOIN staff st 
		ON p.staff_id = st.staff_id
    WHERE
	payment_date BETWEEN '2004-02-14 00:00:00' AND  '2004-02-14 23:59:00' 
    GROUP BY 
		st.staff_id
        , p.amount
    ;
    
SELECT * FROM payment 