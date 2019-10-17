view: order_items {
  sql_table_name: all_orders.order_info ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_items_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.order_items_created_date ;;
  }

  dimension_group: delivered {
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
    sql: ${TABLE}.order_items_delivered_date ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.order_items_inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_items_order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.order_items_returned_date ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.order_items_sale_price ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.order_items_shipped_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.order_items_status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.order_items_user_id ;;
  }

#   Added Fields #

  dimension: gross_margin {
    type: number
    value_format_name: usd
    sql: ${sale_price} - ${inventory_items.cost} ;;
  }

  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
  }

  measure: total_gross_margin {
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
