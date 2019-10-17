view: inventory_items {
  sql_table_name: all_orders.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.inventory_items_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.inventory_items_cost ;;
  }

  dimension_group: inventory_items_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.inventory_items_created_date ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.inventory_items_product_brand ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.inventory_items_product_category ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.inventory_items_product_department ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.inventory_items_product_distribution_center_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.inventory_items_product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.inventory_items_product_name ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.inventory_items_product_retail_price ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.inventory_items_product_sku ;;
  }

  dimension: sold_date {
    type: string
    sql: ${TABLE}.inventory_items_sold_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name]
  }
}
