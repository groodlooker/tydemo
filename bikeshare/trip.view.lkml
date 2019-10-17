view: trip {
  sql_table_name: bike_share.trip ;;
  drill_fields: [trip_id]

  dimension: trip_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.trip_id ;;
  }

  dimension: bikeid {
    type: string
    sql: ${TABLE}.bikeid ;;
  }

  dimension: birthyear {
    type: number
    sql: ${TABLE}.birthyear ;;
  }

  dimension: from_station_id {
    type: string
    sql: ${TABLE}.from_station_id ;;
  }

  dimension: from_station_name {
    type: string
    sql: ${TABLE}.from_station_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: starttime {
    type: time
    timeframes: [
      raw,
      time,
      day_of_year,
      month_num,
      day_of_week,
      date,
      day_of_month,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.starttime ;;
  }

  dimension: is_weekend {
    type: yesno
    sql: ${starttime_day_of_week} = "Saturday" or ${starttime_day_of_week} = "Sunday" ;;
  }

  dimension_group: stoptime {
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
    sql: ${TABLE}.stoptime ;;
  }

  dimension: to_station_id {
    type: string
    sql: ${TABLE}.to_station_id ;;
  }

  dimension: to_station_name {
    type: string
    sql: ${TABLE}.to_station_name ;;
  }

  dimension: tripduration {
    type: number
    sql: ${TABLE}.tripduration ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  measure: count {
    type: count
    drill_fields: [trip_id, from_station_name, to_station_name]
  }
}
