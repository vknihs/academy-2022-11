with
    categorias as (
        select *		
        from {{ ref('stg_erp__categorias') }}
    )

    , produtos as (
        select *		
        from {{ ref('stg_erp__produtos') }}
    )

    , fornecedores as (
        select *		
        from {{ ref('stg_erp__fornecedores') }}
    )

    , juncao_tabelas as (
        select 
         produtos.id_produto
            , produtos.id_categoria			
            , produtos.id_fornecedor
            , produtos.nome_produto	
            , produtos.quantidade_por_unidade 		
            , produtos.unidades_em_estoque		
            , produtos.undidades_pedidas	
            , produtos.level_do_pedido			
            , produtos.is_discontinued
            , categorias.nome_categoria
            , categorias.descricao			
            , fornecedores.nome_fornecedor
            , fornecedores.contato_fornecedor
            , fornecedores.titulo_fornecedor
            , fornecedores.endereco
            , fornecedores.cidade
            , fornecedores.regiao
            , fornecedores.codigo_postal
            , fornecedores.pais
            , fornecedores.telefone
            , fornecedores.fax
        from produtos
        left join categorias on categorias.id_categoria = produtos.id_categoria
        left join fornecedores on fornecedores.id_fornecedor = produtos.id_fornecedor
    )

    , transformacao as (
        select 
            row_number() over (order by id_produto) as sk_produto
            , *
        from juncao_tabelas
    )

select *
from transformacao