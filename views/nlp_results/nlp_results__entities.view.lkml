view: nlp_results__entities {
  dimension: entity_id {
    type: string
    sql: ${TABLE}.entityId ;;
  }

  dimension: preferred_term {
    type: string
    sql: ${TABLE}.preferredTerm ;;
    # sql: regexp_replace(LOWER(${TABLE}.preferredTerm),"[^a-zA-Z0-9 -]",'');;
  }

  dimension: vocabulary_codes {
    hidden: yes
    sql: ${TABLE}.vocabularyCodes ;;
  }

  measure: count_unique_mentions {
    hidden: yes
    label: "Count of Mentions - Preferred Term"
    type: count
    value_format_name: decimal_0
  }
}
