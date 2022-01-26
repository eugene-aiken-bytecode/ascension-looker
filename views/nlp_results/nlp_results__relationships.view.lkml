view: nlp_results__relationships {
  dimension: confidence {
    label: "Confidence (Relationships)"
    type: number
    sql: ${TABLE}.confidence ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.objectId ;;
  }

  dimension: subject_id {
    type: number
    sql: ${TABLE}.subjectId ;;
  }
}
