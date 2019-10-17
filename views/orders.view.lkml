view: orders {
  sql_table_name: all_orders.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.orders_id ;;
  }

  dimension_group: orders_created {
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
    sql: ${TABLE}.orders_created_date ;;
  }

  dimension: status {
    type: string
    description: "Tells whether order has been cancelled or not"
    sql: ${TABLE}.orders_status ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.orders_traffic_source ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.orders_user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
