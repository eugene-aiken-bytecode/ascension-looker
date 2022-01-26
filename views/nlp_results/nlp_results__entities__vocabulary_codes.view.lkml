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
