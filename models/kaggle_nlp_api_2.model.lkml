 connection: "ehr-search-prod"

# include: "/**/*.view.lkml"                # include all views the project
# include: "/**/*.dashboard.lookml"   # include LookML dashboards

# persist_for: "24 hours"
# label: "Healthcare NLP API"

# explore: kaggle_clinical_notes_nlp_results {

#   label: "Kaggle NLP Results - Patient Review"

#   join: kaggle_clinical_notes_nlp_results__entities {
#     view_label: "(2) NLP Results - Entities"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results.entities}) as kaggle_clinical_notes_nlp_results__entities ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entity_mentions {
#     view_label: "(2) NLP Results - Entities"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results.entity_mentions}) as kaggle_clinical_notes_nlp_results__entity_mentions ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__relationships {
#     view_label: "NLP Results - Relationships"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results.relationships}) as kaggle_clinical_notes_nlp_results__relationships ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entities__vocabulary_codes {
#     view_label: "NLP Results - Entities, Vocabulary Codes"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results__entities.vocabulary_codes}) as kaggle_clinical_notes_nlp_results__entities__vocabulary_codes ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entity_mentions__linked_entities {
#     view_label: "NLP Results - Entity Mentions, Linked Entities"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results__entity_mentions.linked_entities}) as kaggle_clinical_notes_nlp_results__entity_mentions__linked_entities ;;
#     relationship: one_to_many
#   }

#   join: kaggle_nlp_results_vocab {
#     view_label: "(2) NLP Results - Entities"
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${kaggle_nlp_results_vocab.entity_id} = ${kaggle_clinical_notes_nlp_results__entity_mentions__linked_entities.entity_id} ;;
#   }
# }


# explore: kaggle_nlp_results_terms {
#   label: "Kaggle NLP Results - Term Review"
#   always_filter: { filters:[kaggle_nlp_results_terms.filter_on_original_term: "%cancer%"]}

#   join: kaggle_clinical_notes_nlp_results {
#     from: kaggle_clinical_notes_nlp_results
#     view_label: "(1) NLP Results - Overview"
#     type: left_outer
#     sql_on: ${kaggle_nlp_results_terms.observation_id} = ${kaggle_clinical_notes_nlp_results.id}  ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entities {
#     view_label: "(2) NLP Results - Entities"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results.entities}) as kaggle_clinical_notes_nlp_results__entities ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entity_mentions {
#     view_label: "(2) NLP Results - Entities"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results.entity_mentions}) as kaggle_clinical_notes_nlp_results__entity_mentions ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__relationships {
#     view_label: "NLP Results - Relationships"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results.relationships}) as kaggle_clinical_notes_nlp_results__relationships ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entities__vocabulary_codes {
#     view_label: "NLP Results - Entities, Vocabulary Codes"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results__entities.vocabulary_codes}) as kaggle_clinical_notes_nlp_results__entities__vocabulary_codes ;;
#     relationship: one_to_many
#   }

#   join: kaggle_clinical_notes_nlp_results__entity_mentions__linked_entities {
#     view_label: "NLP Results - Entity Mentions, Linked Entities"
#     sql: LEFT JOIN UNNEST(${kaggle_clinical_notes_nlp_results__entity_mentions.linked_entities}) as kaggle_clinical_notes_nlp_results__entity_mentions__linked_entities ;;
#     relationship: one_to_many
#   }

#   join: kaggle_nlp_results_vocab {
#     view_label: "(2) NLP Results - Entities"
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${kaggle_nlp_results_vocab.entity_id} = ${kaggle_clinical_notes_nlp_results__entity_mentions__linked_entities.entity_id} ;;
#   }

# }
