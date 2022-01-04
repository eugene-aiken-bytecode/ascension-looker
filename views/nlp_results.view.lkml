#Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: nlp_results {
#   hidden: yes

#   join: nlp_results__entities {
#     view_label: "NLP API"
#     # view_label: "Nlp Results: Entities"
#     sql: LEFT JOIN UNNEST(${nlp_results.entities}) as nlp_results__entities ;;
#     relationship: one_to_many
#   }

#   join: nlp_results__entity_mentions {
#     view_label: "NLP API"
#     # view_label: "Nlp Results: Entitymentions"
#     sql: LEFT JOIN UNNEST(${nlp_results.entity_mentions}) as nlp_results__entity_mentions ;;
#     relationship: one_to_many
#   }

#   join: nlp_results__relationships {
#     view_label: "NLP API"
#     # view_label: "Nlp Results: Relationships"
#     sql: LEFT JOIN UNNEST(${nlp_results.relationships}) as nlp_results__relationships ;;
#     relationship: one_to_many
#   }

#   join: nlp_results__entities__vocabulary_codes {
#     view_label: "NLP API"
#     # view_label: "Nlp Results: Entities Vocabularycodes"
#     sql: LEFT JOIN UNNEST(${nlp_results__entities.vocabulary_codes}) as nlp_results__entities__vocabulary_codes ;;
#     relationship: one_to_many
#   }

#   join: nlp_results__entity_mentions__linked_entities {
#     view_label: "NLP API"
#     # view_label: "Nlp Results: Entitymentions Linkedentities"
#     sql: LEFT JOIN UNNEST(${nlp_results__entity_mentions.linked_entities}) as nlp_results__entity_mentions__linked_entities ;;
#     relationship: one_to_many
#   }
# }

view: nlp_results {
  sql_table_name: `asc-ahnat-adsi-sandbox.oncology_nlp_api.nlpresults_withpreviousdiagnosis`
    ;;

  dimension: diagnostic_report_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.DiagnosticReportId ;;
  }

  dimension: previous_cancer {
    hidden: no
    type: yesno
    sql: ${TABLE}.previousDiagnosis = 1;;
  }

  dimension: entities {
    hidden: yes
    sql: ${TABLE}.entities ;;
  }

  dimension: entity_mentions {
    hidden: yes
    sql: ${TABLE}.entityMentions ;;
  }

  dimension: raw_text {
    type: string
    sql: ${TABLE}.rawText ;;
  }

  dimension: relationships {
    hidden: yes
    sql: ${TABLE}.relationships ;;
  }
  dimension: text_highlighted {
    hidden: no
    label: "Text (Highlighted) Processed by NLP"
    sql: ${raw_text} ;;
    html:
          {% assign w = nlp_results__entity_mentions.text_list | split: '|RECORD|' %}

          {% if w[0] %} {% assign w0 = w[0] %} {% else %} {% assign w0 = 'zzzzzzz' %} {% endif %}
          {% if w[1] %} {% assign w1 = w[1] %} {% else %} {% assign w1 = 'zzzzzzz' %} {% endif %}
          {% if w[2] %} {% assign w2 = w[2] %} {% else %} {% assign w2 = 'zzzzzzz' %} {% endif %}
          {% if w[3] %} {% assign w3 = w[3] %} {% else %} {% assign w3 = 'zzzzzzz' %} {% endif %}
          {% if w[4] %} {% assign w4 = w[4] %} {% else %} {% assign w4 = 'zzzzzzz' %} {% endif %}
          {% if w[5] %} {% assign w5 = w[5] %} {% else %} {% assign w5 = 'zzzzzzz' %} {% endif %}
          {% if w[6] %} {% assign w6 = w[6] %} {% else %} {% assign w6 = 'zzzzzzz' %} {% endif %}
          {% if w[7] %} {% assign w7 = w[7] %} {% else %} {% assign w7 = 'zzzzzzz' %} {% endif %}
          {% if w[8] %} {% assign w8 = w[8] %} {% else %} {% assign w8 = 'zzzzzzz' %} {% endif %}
          {% if w[9] %} {% assign w9 = w[9] %} {% else %} {% assign w9 = 'zzzzzzz' %} {% endif %}
          {% if w[10] %} {% assign w10 = w[10] %} {% else %} {% assign w10 = 'zzzzzzz' %} {% endif %}
          {% if w[11] %} {% assign w11 = w[11] %} {% else %} {% assign w11 = 'zzzzzzz' %} {% endif %}
          {% if w[12] %} {% assign w12 = w[12] %} {% else %} {% assign w12 = 'zzzzzzz' %} {% endif %}
          {% if w[13] %} {% assign w13 = w[13] %} {% else %} {% assign w13 = 'zzzzzzz' %} {% endif %}
          {% if w[14] %} {% assign w14 = w[14] %} {% else %} {% assign w14 = 'zzzzzzz' %} {% endif %}
          {% if w[15] %} {% assign w15 = w[15] %} {% else %} {% assign w15 = 'zzzzzzz' %} {% endif %}
          {% if w[16] %} {% assign w16 = w[16] %} {% else %} {% assign w16 = 'zzzzzzz' %} {% endif %}
          {% if w[17] %} {% assign w17 = w[17] %} {% else %} {% assign w17 = 'zzzzzzz' %} {% endif %}
          {% if w[18] %} {% assign w18 = w[18] %} {% else %} {% assign w18 = 'zzzzzzz' %} {% endif %}
          {% if w[19] %} {% assign w19 = w[19] %} {% else %} {% assign w19 = 'zzzzzzz' %} {% endif %}
          {% if w[20] %} {% assign w20 = w[20] %} {% else %} {% assign w20 = 'zzzzzzz' %} {% endif %}
          {% if w[21] %} {% assign w21 = w[21] %} {% else %} {% assign w21 = 'zzzzzzz' %} {% endif %}
          {% if w[22] %} {% assign w22 = w[22] %} {% else %} {% assign w22 = 'zzzzzzz' %} {% endif %}
          {% if w[23] %} {% assign w23 = w[23] %} {% else %} {% assign w23 = 'zzzzzzz' %} {% endif %}
          {% if w[24] %} {% assign w24 = w[24] %} {% else %} {% assign w24 = 'zzzzzzz' %} {% endif %}
          {% if w[25] %} {% assign w25 = w[25] %} {% else %} {% assign w25 = 'zzzzzzz' %} {% endif %}

          {% if w[26] %} {% assign w26 = w[26] %} {% else %} {% assign w26 = 'zzzzzzz' %} {% endif %}
          {% if w[27] %} {% assign w27 = w[27] %} {% else %} {% assign w27 = 'zzzzzzz' %} {% endif %}

          {% assign h0 = w0 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h1 = w1 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h2 = w2 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h3 = w3 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h4 = w4 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h5 = w5 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h6 = w6 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h7 = w7 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h8 = w8 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h9 = w9 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h10 = w10 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h11 = w11 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h12 = w12 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h13 = w13 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h14 = w14 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h15 = w15 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h16 = w16 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h17 = w17 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h18 = w18 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h19 = w19 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h20 = w20 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h21 = w21 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h22 = w22 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h23 = w23 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h24 = w24 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h25 = w25 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h26 = w26 | prepend: '<mark>' | append: '</mark>' %}
          {% assign h27 = w27 | prepend: '<mark>' | append: '</mark>' %}
          <div>{{value | replace:w0, h0
              | replace: w1, h1
              | replace: w2, h2
              | replace: w3, h3
              | replace: w4, h4
              | replace: w5, h5
              | replace: w6, h6
              | replace: w7, h7
              | replace: w8, h8
              | replace: w9, h9
              | replace: w10, h10
              | replace: w11, h11
              | replace: w12, h12
              | replace: w13, h13
              | replace: w14, h14
              | replace: w15, h15
              | replace: w16, h16
              | replace: w17, h17
              | replace: w18, h18
              | replace: w19, h19
              | replace: w20, h20
              | replace: w21, h21
              | replace: w22, h22
              | replace: w23, h23
              | replace: w24, h24
              | replace: w25, h25
              | replace: w26, h26
              | replace: w27, h27
              }}</div>
          ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }

}

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

  dimension: text__begin_offset {
    type: number
    sql: ${TABLE}.text.beginOffset ;;
    group_label: "Text"
    group_item_label: "Begin Offset"
  }

  dimension: text__content {
    type: string
    sql: ${TABLE}.text.content ;;
    group_label: "Text"
    group_item_label: "Content"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  measure: text_list {
    type: list
    list_field: text__content
  }

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

view: nlp_results__entities__vocabulary_codes {
  dimension: nlp_results__entities__vocabulary_codes {
    type: string
    sql: nlp_results__entities__vocabulary_codes ;;
  }

  dimension: vocab_codes_linked {
    group_label: "Vocab Codes"
    label: "Vocab Codes (String)"
    type: string
    sql: ${nlp_results__entities__vocabulary_codes} ;;

    link: {
      label: "Google this Vocabulary Code"
      url: "https://www.google.com/search?q={{value | url_encode}}+code"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }

  measure: vocabulary_codes_list {
    type: list
    list_field: nlp_results__entities__vocabulary_codes
  }

  dimension: vocabulary {
    group_label: "Vocab Codes"
    label: "Vocab Source (Unnested)"
    type: string
    sql: CASE
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'FMA/%' THEN 'Foundational Model of Anatomy'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'GO/%' THEN 'Gene Ontology'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'HGNC/%' THEN 'HUGO Gene Nomenclature Committee'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'HPO/%' THEN 'Human Phenotype Ontology'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'ICD9CM/%' THEN 'ICD-9-CM'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'MSH/%' THEN 'MeSH'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'MTH/%' THEN 'Metathesaurus Names'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'NCBI/%' THEN 'NCBI Taxonomy'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'NCI/%' THEN 'NCI Thesaurus'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'OMIM/%' THEN 'Online Mendelian Inheritance in Man'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'RXNORM/%' THEN 'RXNORM'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'LNC/%' THEN 'LOINC'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'ICD10PCS/%' THEN 'ICD-10 Procedure Coding System'
        WHEN ${nlp_results__entities__vocabulary_codes} LIKE 'VANDF/%' THEN 'National Drug File'
        ELSE 'unknown' END ;;
    link: {
      label: "Google this Vocabulary Source"
      url: "https://www.google.com/search?q={{value | url_encode}}"
      icon_url: "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png"
    }
  }
}

view: nlp_results__entity_mentions__linked_entities {
  dimension: entity_id {
    label: "Entity Id (Linked)"
    type: string
    sql: ${TABLE}.entityId ;;
  }
}
