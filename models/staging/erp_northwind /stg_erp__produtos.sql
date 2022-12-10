with
    source_products as (
        select
            cast(product_id as int) as id_produto
            , cast (supplier_id as int) as id_fornecedor			
            , cast (category_id	as int) as id_categoria
            , cast (product_name as string) as nome_produto	
            , cast (quantity_per_unit as string) as quantidade_por_unidade 		
            , cast (units_in_stock as int) as unidades_em_estoque		
            , cast (units_on_order as int) as undidades_pedidas	
            , cast (reorder_level as int) as level_do_pedido			
            , case
                when discontinued = 1 then true
                else false
            end as is_discontinued
        from {{source('erp', 'products')}}
    )
select *
from source_products