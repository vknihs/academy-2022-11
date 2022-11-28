with
    source_suppliers as (
        select
            cast(supplier_id as int) as id_fornecedor			
            , cast(company_name as string) as nome_fornecedor
            , cast(contact_name as string) as contato_fornecedor
            , cast(contact_title as string) as titulo_fornecedor
            , cast(address as string) as endereco
            , cast(city as string) as cidade
            , cast(region as string) as regiao
            , cast(postal_code as string) as codigo_postal
            , cast(country as string) as pais
            , cast(phone as string) as telefone
            , cast(fax as string) as fax
            --, cast(homepage as string) as website
        from {{ source('erp', 'suppliers') }}
    )
select *
from source_suppliers
