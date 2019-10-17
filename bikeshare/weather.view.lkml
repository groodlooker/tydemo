explore: weather {}

view: weather {
  sql_table_name: bike_share.weather ;;

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: pk {
    primary_key: yes
    sql: cast(${TABLE}.date as string) ;;
  }

  dimension: events {
    type: string
    sql: ${TABLE}.events ;;
  }

  dimension: max_dew_point_f {
    type: number
    sql: ${TABLE}.max_dew_point_f ;;
  }

  dimension: max_gust_speed_mph {
    type: string
    sql: ${TABLE}.max_gust_speed_mph ;;
  }

  dimension: max_humidity {
    type: number
    sql: ${TABLE}.max_humidity ;;
  }

  dimension: max_sea_level_pressure_in {
    type: number
    sql: ${TABLE}.max_sea_level_pressure_in ;;
  }

  dimension: max_temperature_f {
    type: number
    sql: ${TABLE}.max_temperature_f ;;
  }

  dimension: max_visibility_miles {
    type: number
    sql: ${TABLE}.max_visibility_miles ;;
  }

  dimension: max_wind_speed_mph {
    type: number
    sql: ${TABLE}.max_wind_speed_mph ;;
  }

  dimension: did_rain {
    type: yesno
    sql: ${precipitation_in} > 0 ;;
  }

  dimension: mean_dew_point_f {
    type: number
    sql: ${TABLE}.mean_dew_point_f ;;
  }

  dimension: mean_humidity {
    type: number
    sql: ${TABLE}.mean_humidity ;;
  }

  dimension: mean_sea_level_pressure_in {
    type: number
    sql: ${TABLE}.mean_sea_level_pressure_in ;;
  }

  dimension: mean_temperature_f {
    type: number
    sql: ${TABLE}.mean_temperature_f ;;
  }

  dimension: mean_visibility_miles {
    type: number
    sql: ${TABLE}.mean_visibility_miles ;;
  }

  dimension: mean_wind_speed_mph {
    type: number
    sql: ${TABLE}.mean_wind_speed_mph ;;
  }

  dimension: min_dewpoint_f {
    type: number
    sql: ${TABLE}.min_dewpoint_f ;;
  }

  dimension: min_humidity {
    type: number
    sql: ${TABLE}.min_humidity ;;
  }

  dimension: min_sea_level_pressure_in {
    type: number
    sql: ${TABLE}.min_sea_level_pressure_in ;;
  }

  measure: max_temp {
    type: max
    sql: ${max_temperature_f} ;;
  }

  dimension: min_temperature_f {
    type: number
    sql: ${TABLE}.min_temperature_f ;;
  }

  dimension: min_visibility_miles {
    type: number
    sql: ${TABLE}.min_visibility_miles ;;
  }

  dimension: precipitation_in {
    type: number
    sql: ${TABLE}.precipitation_in ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
