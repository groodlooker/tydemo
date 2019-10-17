connection: "looker_app"

datagroup: tyson_hands_on_default_datagroup {
  sql_trigger: SELECT MAX(year) FROM `fh-bigquery.popular_names.usa_1910_2013`;;
  max_cache_age: "72 hour"
}

persist_with: tyson_hands_on_default_datagroup

include: "/views/*.view"
include: "/names/*.view"
include: "/bikeshare/*.view"

explore: trip {
  label: "Seattle Bike Trips"
  join: start_station {
    from: station
    relationship: many_to_one
    type: left_outer
    sql_on: ${trip.from_station_id} = ${start_station.station_id};;
  }
  join: end_station {
    from: station
    relationship: many_to_one
    type: left_outer
    sql_on: ${trip.to_station_id} = ${end_station.station_id};;
  }
  join:  weather {
    relationship: many_to_one
    type: inner
    sql_on: ${trip.starttime_date} = ${weather.date_date} ;;
  }
  join: trip_count_prediction {
    relationship: many_to_one
    sql_on: ${trip.starttime_date} = ${trip_count_prediction.starttime_date} ;;
    type: left_outer
  }
}

explore: usa_summary_names {
  label: "US Names Dataset"
  join: rank_by_gender {
    view_label: "Name Ranks"
    type: inner
    sql_on: ${usa_summary_names.gender} = ${rank_by_gender.gender}
    and ${rank_by_gender.name} = ${usa_summary_names.name}
    ;;
    relationship: one_to_one
  }
  join: rank_by_gender_year {
    view_label: "Name Ranks"
    type: inner
    sql_on: ${usa_summary_names.gender} = ${rank_by_gender.gender}
    and ${rank_by_gender.name} = ${usa_summary_names.name}
    and ${rank_by_gender_year.year} = ${usa_summary_names.year}
    ;;
    relationship: one_to_one
  }
  join: rank_by_gender_state {
    view_label: "Name Ranks"
    type: inner
    sql_on: ${usa_summary_names.gender} = ${rank_by_gender_state.gender}
    and ${rank_by_gender_state.name} = ${usa_summary_names.name}
    and ${rank_by_gender_state.state} = ${usa_summary_names.state} ;;
    relationship: one_to_one
  }
  join: rank_by_gender_state_year {
    view_label: "Name Ranks"
    type: inner
    sql_on: ${usa_summary_names.gender} = ${rank_by_gender_state_year.gender}
          and ${rank_by_gender_state_year.name} = ${usa_summary_names.name}
          and ${rank_by_gender_state_year.state} = ${usa_summary_names.state}
          and ${rank_by_gender_state_year.year} = ${usa_summary_names.year}
          ;;
    relationship: one_to_one
  }
}

# explore: order_items {}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    fields: []
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}
