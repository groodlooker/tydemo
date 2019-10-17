# If necessary, uncomment the line below to include explore_source.
# include: "usa_1910_2013.view.lkml"

view: rank_by_gender {
  derived_table: {
    datagroup_trigger: tyson_hands_on_default_datagroup
    explore_source: usa_summary_names {
      column: count_of_name {}
      column: name {}
      column: gender {}
      derived_column: rank_gender {
        sql: RANK() OVER(PARTITION BY gender ORDER BY count_of_name desc) ;;
      }
    }
  }
  dimension: count_of_name {
    type: number
    hidden: yes
  }
  dimension: name {
    hidden: yes
  }
  dimension: gender {
    hidden: yes
  }
  dimension: rank_gender {
    type: number
  }
}

view: rank_by_gender_year {
  derived_table: {
    datagroup_trigger: tyson_hands_on_default_datagroup
    explore_source: usa_summary_names {
      column: count_of_name {}
      column: name {}
      column: year {}
      column: gender {}
      derived_column: rank_gender_year {
        sql: RANK() OVER(PARTITION BY gender, year ORDER BY count_of_name desc) ;;
      }
    }
  }
  dimension: count_of_name {
    type: number
    hidden: yes
  }
  dimension: name {
    hidden: yes
  }
  dimension: gender {
    hidden: yes
  }
  dimension: year {
    hidden: yes
    type: number
  }
  dimension: rank_gender_year {type: number}
}

view: rank_by_gender_state {
  derived_table: {
    datagroup_trigger: tyson_hands_on_default_datagroup
    explore_source: usa_summary_names {
      column: count_of_name {}
      column: name {}
      column: state {}
      column: gender {}
      derived_column: rank_gender_state {
        sql: RANK() OVER(PARTITION BY gender, state ORDER BY count_of_name desc) ;;
      }
    }
  }
  dimension: count_of_name {
    type: number
    hidden: yes
  }
  dimension: name {
    hidden: yes
  }
  dimension: gender {
    hidden: yes
  }
  dimension: state {
    hidden: yes
  }

  dimension: rank_gender_state {type: number}

}

view: rank_by_gender_state_year {
  derived_table: {
    datagroup_trigger: tyson_hands_on_default_datagroup
    explore_source: usa_summary_names {
      column: count_of_name {}
      column: name {}
      column: state {}
      column: year {}
      column: gender {}
      derived_column: rank_gender_state_year {
        sql: RANK() OVER(PARTITION BY year, gender, state ORDER BY count_of_name desc) ;;
      }
    }
  }
  dimension: count_of_name {
    type: number
    hidden: yes
  }
  dimension: name {
    hidden: yes
  }
  dimension: gender {
    hidden: yes
  }

  dimension: state {
    hidden: yes
  }
  dimension: year {
    hidden: yes
    type: number
  }

  dimension: rank_gender_state_year {type: number}
}
