view: nlp_results__entity_mentions {
  dimension: certainty_assessment__confidence {
    type: number
    sql: ${TABLE}.certaintyAssessment.confidence ;;
    value_format_name: percent_2
    group_label: "Certainty Assessment"
    group_item_label: "Confidence"
  }

  dimension: certainty_assessment__value {
    type: string
    sql: ${TABLE}.certaintyAssessment.value ;;
    group_label: "Certainty Assessment"
    group_item_label: "Value"
  }

  dimension: confidence {
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.confidence ;;
  }

  dimension: linked_entities {
    hidden: yes
    sql: ${TABLE}.linkedEntities ;;
  }

  dimension: mention_id {
    type: number
    sql: ${TABLE}.mentionId ;;
  }

  dimension: subject__confidence {
    type: number
    sql: ${TABLE}.subject.confidence ;;
    value_format_name: percent_2
    group_label: "Subject"
    group_item_label: "Confidence"
  }

  dimension: subject__value {
    type: string
    sql: ${TABLE}.subject.value ;;
    group_label: "Subject"
    group_item_label: "Value"
  }

  dimension: temporal_assessment__confidence {
    type: number
    sql: ${TABLE}.temporalAssessment.confidence ;;
    value_format_name: percent_2
    group_label: "Temporal Assessment"
    group_item_label: "Confidence"
  }

  dimension: temporal_assessment__value {
    type: string
    sql: ${TABLE}.temporalAssessment.value ;;
    group_label: "Temporal Assessment"
    group_item_label: "Value"
  }

  # dimension: text__begin_offset {
  #   type: number
  #   sql: ${TABLE}.text.beginOffset ;;
  #   group_label: "Text"
  #   group_item_label: "Begin Offset"
  # }

  # dimension: text__content {
  #   type: string
  #   sql: ${TABLE}.text.content ;;
  #   group_label: "Text"
  #   group_item_label: "Content"
  # }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

##########################  OTHER FLAGS ##########################

  dimension: is_patient_current_medication {
    type: yesno
    sql:
        (${certainty_assessment__value} = 'LIKELY'
    AND ${subject__value} ='PATIENT'
    AND ${temporal_assessment__value} = 'CURRENT'
    AND ${type} = 'MEDICINE'
    AND ${confidence_percent} >= 90
    )
  ;;
    description: "Patient currently has a LIKELY or SOMEWHAT LIKELY probability of taking these flagged medications."
  }

  dimension: is_patient_clinical_history {
    type: yesno
    sql:
        (${certainty_assessment__value} = 'LIKELY'
    AND ${subject__value} ='PATIENT'
    AND ${temporal_assessment__value} = 'CLINICAL_HISTORY'
    AND ${confidence_percent} >= 90
    )
    --AND ${type} = 'procedure'
  ;;
    description: "Patient is LIKELY to have flagged clinical history."
  }

  dimension: is_patient_current_problem {
    type: yesno
    sql:
        (${certainty_assessment__value} = 'LIKELY'
    AND ${subject__value} ='PATIENT'
    AND ${temporal_assessment__value} = 'CURRENT'
    AND ${confidence_percent} >= 90
    AND ${type} = 'PROBLEM'
    )
  ;;
    description: "Patient is LIKELY to have flagged clinical history."
  }


  dimension: text__begin_offset {
    type: number
    sql: ${TABLE}.text.beginOffset ;;
    group_label: "(1) Term"
    group_item_label: "Begin Offset"
  }

  measure: text_location {
    hidden: yes
    type: sum
    sql: ${text__begin_offset} ;;
  }

  dimension: text__content {
    full_suggestions: yes
    type: string
    sql: regexp_replace(LOWER(${TABLE}.text.content),"[^a-zA-Z0-9 -]",' ');;
    #sql: ${TABLE}.text.content ;;
    group_label: "(1) Term"
    label: "Original Term"
    #group_item_label: "Content"
    link: {
      label: "See Term View for {{ value }}"
      url: "/dashboards-next/healthcare_nlp_api_2.0::nlp_term_view_2_0?Filter+on+Original+Term=%25{{ value | url_encode }}%25"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: text__content_medicine {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_current_medication} = True THEN ${text__content} ELSE NULL END;;
    group_label: "(1) Term"
    group_item_label: "Original Term - Medication"
  }

  dimension: text__content_problem {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_current_problem} = True THEN ${text__content} ELSE NULL END;;
    group_label: "(1) Term"
    group_item_label: "Original Term - Problem"
  }

  dimension: text__content_clinical_history {
    #hidden: yes
    type: string
    sql: CASE WHEN ${is_patient_clinical_history} = True THEN ${text__content} ELSE NULL END;;
    group_label: "(1) Term"
    group_item_label: "Original Term - Clinical History"
  }

  measure: text_list {
    label: "Text List"
    description: "All original flagged terms"
    type: list
    list_field: text__content
    order_by_field: confidence_mean
    #filters: [type  = "PROBLEM"]
  }

  measure: text_list_medicine {
    description: "Flagged terms, medication only"
    type: list
    list_field: text__content_medicine
    order_by_field: confidence_mean
  }

  measure: text_list_problem {
    description: "Flagged terms, problems or conditions only"
    type: list
    list_field: text__content_problem
    order_by_field: confidence_mean
  }

  measure: text_list_clinical_history {
    description: "Flagged terms, clinical history only"
    type: list
    list_field: text__content_clinical_history
    order_by_field: confidence_mean
  }


  dimension: content_text {
    hidden: yes
    sql: regexp_replace(LOWER(${text__content}),"[^a-zA-Z0-9 -]",' ') ;;
  }

  dimension: is_allergy_related {
    hidden: yes
    type: string
    sql: CASE
              WHEN (${content_text}) LIKE '%allergies%'
              OR   (${content_text}) LIKE '%allergy%'
              OR   (${content_text}) LIKE '%allergic%'
              OR   (${content_text}) LIKE '%intolerant%'
              OR   (${content_text}) LIKE '%hypersensitivity%' THEN 1
              ELSE 0 END
    ;;
  }

  dimension: is_overall_high_confidence {
    hidden: yes
    type: string
    sql: CASE WHEN ${confidence} >= 0.60 THEN 1 ELSE 0 END ;;
  }




  ##########################  ALLERGY ANALYSIS ##########################

  dimension: has_allergies {
    type: yesno
    sql:
        ${is_allergy_related} = 1
    AND ${is_overall_high_confidence} = 1
    AND ${subject__value}='PATIENT'
    AND ${temporal_assessment__value} = 'CURRENT'
    AND ${type} = 'problem';;
    description: "Patient currently has a likelihood of allergies with a confidence > 0.60"
  }

  dimension: is_smoking_related {
    #hidden: yes
    type: string
    sql: CASE
              WHEN (${content_text}) LIKE '%smoking%'
              OR   (${content_text}) LIKE '%tobacco%'
              OR   (${content_text}) LIKE '%smoker%' THEN 1
              ELSE 0 END
    ;;
  }

  dimension: smoking_history {
    type: yesno
    sql:
        ${is_smoking_related} = 1
    AND ${is_overall_high_confidence} = 1
    AND ${subject__value}='PATIENT'
    AND ${temporal_assessment__value} = 'CLINICAL_HISTORY'
    AND ${type} = 'SUBSTANCE_ABUSE';;
    description: "Patient currently has a likely history of smoking with a confidence > 0.60"
  }

  # dimension: entity_mentions_primary_key {
  #   primary_key: yes
  #   hidden: yes
  #   sql: ${nlp_results.observation_id} || '-' || ${mention_id}  ;;
  # }

  measure: count_unique_mentions {
    label: "Count of Mentions - Original Term"
    type: count
    value_format_name: decimal_0
  }

  dimension: confidence_percent {
    label: "Confidence %"
    type: number
    sql: ${confidence}*100 ;;
    value_format_name: decimal_0
  }

  measure: confidence_min {
    label: "Confidence Min"
    type: min
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_max {
    label: "Confidence Max"
    type: max
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_mean {
    label: "Confidence Mean"
    type: average
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  measure: confidence_median {
    label: "Confidence Median"
    type: median
    sql: ${confidence} ;;
    value_format_name: decimal_2
  }

  # measure: text_list {
  #   type: list
  #   list_field: text__content
  # }

  dimension: type_category {
    full_suggestions: yes
    label: "Term Type Category"
    type: string
    sql: CASE
              WHEN ${type} LIKE 'bm%' THEN 'BM Related'
              WHEN ${type} LIKE 'med %' THEN 'Medication Related'
              WHEN ${type} = 'medicine' THEN 'Medication'
              WHEN ${type} LIKE 'procedure%' THEN 'Procedure Related'
              WHEN ${type} LIKE 'lab%' THEN 'Lab Related'
              WHEN ${type} = 'body function' THEN 'Body Function or Measurement'
              WHEN ${type} = 'body measurement' THEN 'Body Function or Measurement'
              WHEN ${type} = 'problem' THEN 'Problem or Condition'
              WHEN ${type} = 'family' THEN 'Family Related'
              WHEN ${type} LIKE 'bf%' THEN 'BF Related'
              WHEN ${type} = 'severity' THEN 'Severity'
              WHEN ${type} = 'substance abuse' THEN 'Substance Abuse'
              WHEN ${type} = 'anatomical structure' THEN 'Anatomical Structure'
              WHEN ${type} = 'medical device' THEN 'Medical Device'
              ELSE ${type} END
      ;;
  }

  dimension: entity_mentions_primary_key {
    primary_key: yes
    hidden: yes
    sql: ${nlp_results.diagnostic_report_id} || '-' || ${mention_id}  ;;
  }


}
