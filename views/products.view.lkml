view: products {
  sql_table_name: all_orders.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.products_id ;;
  }

  dimension: brand {
    type: string
    drill_fields: [name]
    sql: ${TABLE}.products_brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.products_category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.products_cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.products_department ;;
  }

  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.products_distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.products_name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.products_retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.products_sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
