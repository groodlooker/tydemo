view: usa_summary_names {
  sql_table_name: `fh-bigquery.popular_names.usa_1910_2013`
    ;;

    drill_fields: [drills*]

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: first_letter {
    type: string
    drill_fields: [name,gender]
    sql: SUBSTR(${name},0,1) ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count_of_name {
    type: sum
    sql: ${number} ;;
  }

  set: drills {
    fields: [name,state,year,count_of_name]
  }

  measure: record_count {
    type: count
  }
}
