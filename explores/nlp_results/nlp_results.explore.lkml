include: "/views/nlp_results/*.view.lkml"

explore: nlp_results {

  label: "NLP Results - Patient View"

  join: nlp_results__entities {
    view_label: "NLP API"
    # view_label: "Nlp Results: Entities"
    sql: LEFT JOIN UNNEST(${nlp_results.entities}) as nlp_results__entities ;;
    relationship: one_to_many
  }

  join: nlp_results__entity_mentions {
    view_label: "NLP API"
    # view_label: "Nlp Results: Entitymentions"
    sql: LEFT JOIN UNNEST(${nlp_results.entity_mentions}) as nlp_results__entity_mentions ;;
    relationship: one_to_many
  }

  join: nlp_results__relationships {
    view_label: "NLP API"
    # view_label: "Nlp Results: Relationships"
    sql: LEFT JOIN UNNEST(${nlp_results.relationships}) as nlp_results__relationships ;;
    relationship: one_to_many
  }

  join: nlp_results__entities__vocabulary_codes {
    view_label: "NLP API"
    # view_label: "Nlp Results: Entities Vocabularycodes"
    sql: LEFT JOIN UNNEST(${nlp_results__entities.vocabulary_codes}) as nlp_results__entities__vocabulary_codes ;;
    relationship: one_to_many
  }

  join: nlp_results__entity_mentions__linked_entities {
    view_label: "NLP API"
    # view_label: "Nlp Results: Entitymentions Linkedentities"
    sql: LEFT JOIN UNNEST(${nlp_results__entity_mentions.linked_entities}) as nlp_results__entity_mentions__linked_entities ;;
    relationship: one_to_many
  }
}
