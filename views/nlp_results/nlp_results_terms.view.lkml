view: nlp_results_terms {
  label: "*Preferred Term Filter"
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT
          nlp_results.DiagnosticReportId  AS diagnostic_report_id,
          regexp_replace(LOWER(nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ') AS original_term,
          nlp_results__entity_mentions.text.beginOffset AS text_begin_offset

      FROM `asc-ahnat-adsi-sandbox.oncology_nlp_api.nlpresults_withpreviousdiagnosis_table`
      --UPDATE THIS TO REFLECT YOUR TABLE IN YOUR UNDERLYING DATABASE
           AS nlp_results

      LEFT JOIN UNNEST(nlp_results.entityMentions) as nlp_results__entity_mentions

      WHERE {% condition filter_on_original_term %} regexp_replace(LOWER(nlp_results__entity_mentions.text.content),"[^a-zA-Z0-9 -]",' ') {% endcondition %}
       ;;
  }

  measure: count {
    hidden: yes
    type: count
  }

  dimension: unique_id {
    hidden: yes
    type: string
    sql:  ${diagnostic_report_id}_id} || ${text_begin_offset};;
  }

  dimension: diagnostic_report_id {
    hidden: yes
    type: number
    sql: ${TABLE}.diagnostic_report_id ;;
  }

  dimension: text_begin_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.text_begin_offset ;;
  }

  dimension: original_term {
    label: "Filtered Text"
    type: string
    #hidden: yes
    sql: ${TABLE}.original_term ;;
  }

  measure: filtered_text_mention_count {
    type: count
    description: "Number of appearances of the mentioned term"
    value_format_name: decimal_0
  }

  measure: filtered_text_observation_count {
    type: count_distinct
    description: "Number of distinct observations"
    sql: ${diagnostic_report_id} ;;
    value_format_name: decimal_0
  }

  measure: filtered_text_distinct_count {
    type: count_distinct
    description: "Number of distinct terms"
    sql: ${original_term} ;;
    value_format_name: decimal_0
  }

  measure: text_list {
    label: "Filtered Text List"
    description: "All original flagged terms"
    type: list
    list_field: original_term
  }

  filter: filter_on_original_term {
    type: string
    sql: {% condition filter_on_original_term %} ${original_term} {% endcondition %} ;;
  }
}
