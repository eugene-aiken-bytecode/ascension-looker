connection: "asc-ahnat-adsi-sandbox"

# include all the views
include: "/views/**/*.view"
include: "/explores/nlp_results/*.explore"
include: "/Dashboards/*.dashboard"

label: "FHIR Simple NLP Results"


datagroup: fhir_simple_nlp_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fhir_simple_nlp_default_datagroup
