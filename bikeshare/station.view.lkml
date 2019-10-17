view: station {
  sql_table_name: bike_share.station ;;
  drill_fields: [station_id]

  dimension: station_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.station_id ;;
  }

  dimension: current_dockcount {
    type: number
    sql: ${TABLE}.current_dockcount ;;
  }

  dimension_group: decommission {
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
    sql: ${TABLE}.decommission_date ;;
  }

  dimension_group: install {
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
    sql: ${TABLE}.install_date ;;
  }

  dimension: install_dockcount {
    type: number
    sql: ${TABLE}.install_dockcount ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension_group: modification {
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
    sql: ${TABLE}.modification_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [station_id, name]
  }
}
