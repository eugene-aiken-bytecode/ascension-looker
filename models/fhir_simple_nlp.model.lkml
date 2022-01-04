connection: "ehr-search-prod"

# include all the views
include: "/views/**/*.view"
include: "/explores/*.explore"
include: "/Dashboards/nlp_dashboards_simple.dashboard.lookml"


datagroup: fhir_simple_nlp_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fhir_simple_nlp_default_datagroup
