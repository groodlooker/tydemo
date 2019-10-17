view: users {
  sql_table_name: all_orders.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.users_age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.users_city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.users_country ;;
  }

  dimension_group: users_created {
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
    sql: ${TABLE}.users_created_date ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.users_email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.users_first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.users_gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.users_last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.users_latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.users_longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.users_state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.users_traffic_source ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.users_zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }
}
