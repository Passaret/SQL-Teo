-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos

-- SELECT * FROM tb_products ;

SELECT 
    t2.product_category_name,
    sum(t1.price) as receita,
    count(*) as total_itens_vendidos,
    count(DISTINCT t1.order_id) as total_pedidos,
    round(count(*) / cast(count(DISTINCT t1.order_id) as float), 2) as item_por_pedido

FROM tb_order_items as t1

LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id

GROUP BY t2.product_category_name
ORDER BY count(*) / cast(count(DISTINCT t1.order_id) as float) DESC
