view: trip_input {
  derived_table: {
    explore_source: trip {
      column: count {}
      column: max_temp { field: weather.max_temp }
      column: starttime_date {}
      column: is_weekend {}
      column: did_rain {field: weather.did_rain}
      filters: {
        field: trip.starttime_date
        value: "before 2016/08/25"
      }
    }
  }
  dimension: count {
    type: number
  }
  dimension: did_rain {}
  dimension: max_temp {
    type: number
  }
  dimension: starttime_date {
    type: date
  }
  dimension: is_weekend {}
}

view: trip_count_regression {
  derived_table: {
    datagroup_trigger: tyson_hands_on_default_datagroup
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='linear_reg'
        , labels=['count']
        , min_rel_progress = 0.05
        , max_iteration = 50
        ) AS
      SELECT
         * EXCEPT(starttime_date)
      FROM ${trip_input.SQL_TABLE_NAME};;
  }
}

view: trip_count_regression_evaluation {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL ${trip_count_regression.SQL_TABLE_NAME},
          (SELECT * FROM ${trip_input.SQL_TABLE_NAME})) ;;
  }
  dimension: mean_absolute_error {type: number}
  dimension: mean_squared_error {type: number}
  dimension: mean_squared_log_error {type: number}
  dimension: median_absolute_error {type: number}
  dimension: r2_score {type: number}
  dimension: explained_variance {type: number}
}

explore: model_performance {
  from: trip_count_regression_evaluation
}

view: trip_count_training {
  derived_table: {
    sql: SELECT  * FROM ml.TRAINING_INFO(MODEL ${trip_count_regression.SQL_TABLE_NAME});;
  }
  dimension: training_run {type: number}
  dimension: iteration {type: number}
  dimension: loss {type: number}
  dimension: eval_loss {type: number}
  dimension: duration_ms {label:"Duration (ms)" type: number}
  dimension: learning_rate {type: number}
  measure: iterations {type:count}
  measure: total_loss {
    type: sum
    sql: ${loss} ;;
  }
  measure: total_training_time {
    type: sum
    label:"Total Training Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  measure: average_iteration_time {
    type: average
    label:"Average Iteration Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  set: detail {fields: [training_run,iteration,loss,eval_loss,duration_ms,learning_rate]}
}

view: prediction_input {
  derived_table: {
    explore_source: trip {
      column: count {}
      column: max_temp { field: weather.max_temp }
      column: starttime_date {}
      column: is_weekend {}
      column: did_rain {field: weather.did_rain}
      filters: {
        field: trip.starttime_date
        value: "after 2016/08/25"
      }
    }
  }
  dimension: count {
    type: number
  }
  dimension: max_temp {
    type: number
  }
  dimension: did_rain {}
  dimension: starttime_date {
    type: date
  }
}

# explore: trip_count_prediction {}

view: trip_count_prediction {
  derived_table: {
    sql: SELECT * FROM ml.PREDICT(
          MODEL ${trip_count_regression.SQL_TABLE_NAME},
          (SELECT * FROM ${prediction_input.SQL_TABLE_NAME}));;
  }

  dimension: predicted_count {
    type: number
  }

  dimension: residual {
    type:  number
    sql: ${predicted_count} - ${trip_count}  ;;
  }
  dimension: residual_percent {
    type:  number
    value_format_name: percent_1
    sql: 1.0 * ${residual}/NULLIF(${trip_count},0)  ;;
  }

  dimension: starttime_date {
    type: date
    hidden: yes
    primary_key: yes
  }

  dimension: average_temp {
    type: number
  }
  dimension: trip_count {
    type: number
  }
  measure: total_predicted_count {
    type: max
    sql: ${predicted_count} ;;
  }
  measure: overall_residual {
    type: max
    sql: ${residual} ;;
  }
  measure: overall_residual_percent {
    type: max
    value_format_name: percent_1
    sql: ${residual_percent} ;;
  }
}
