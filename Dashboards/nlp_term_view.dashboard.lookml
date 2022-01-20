- dashboard: nlp__term_view
  title: NLP - Term View
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Top 10 - Clinical History
    name: Top 10 - Clinical History
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: looker_grid
    fields: [nlp_results__entity_mentions.text__content_clinical_history, nlp_results__entity_mentions.count_unique_mentions,
      nlp_results__entity_mentions.confidence_mean]
    filters:
      nlp_results__entity_mentions.text__content_clinical_history: "-NULL"
    sorts: [nlp_results__entity_mentions.count_unique_mentions desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      nlp_results__entity_mentions.count_unique_mentions:
        is_active: true
        value_display: true
        palette:
          palette_id: ad31c724-344c-fa20-c1e0-f6b125e5ea46
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#F4B400"
          - "#F4B400"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Top 10 - Current Problems/Conditions
    name: Top 10 - Current Problems/Conditions
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: looker_grid
    fields: [nlp_results__entity_mentions.count_unique_mentions, nlp_results__entity_mentions.confidence_mean,
      nlp_results__entity_mentions.text__content_problem]
    filters:
      nlp_results__entity_mentions.text__content_problem: "-NULL"
    sorts: [nlp_results__entity_mentions.count_unique_mentions desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      nlp_results__entity_mentions.count_unique_mentions:
        is_active: true
        value_display: true
        palette:
          palette_id: a4bf61d7-733f-379a-9b8b-209816c4dbfc
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#4285F4"
          - "#4285F4"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Top 10 - Medications
    name: Top 10 - Medications
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: looker_grid
    fields: [nlp_results__entity_mentions.count_unique_mentions, nlp_results__entity_mentions.confidence_mean,
      nlp_results__entity_mentions.text__content_medicine]
    filters:
      nlp_results__entity_mentions.text__content_medicine: "-NULL"
    sorts: [nlp_results__entity_mentions.count_unique_mentions desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      nlp_results__entity_mentions.count_unique_mentions:
        is_active: true
        value_display: true
        palette:
          palette_id: b155062d-03e7-f5c7-a033-382502d85142
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#0F9D58"
          - "#0F9D58"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 0
    col: 8
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: looker_grid
    fields: [nlp_results_terms.text_list, nlp_results_terms.filtered_text_mention_count]
    filters: {}
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: List of Original Term,
        based_on: nlp_results__entity_mentions.text__content, _kind_hint: measure,
        measure: list_of_original_term, type: list, _type_hint: list, filters: {}}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '18'
    rows_font_size: '35'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations: {}
    series_text_format:
      nlp_results__entity_mentions.text_list_problem:
        align: center
        fg_color: "#B32F37"
        bold: true
      nlp_results_terms.text_list:
        bold: true
        fg_color: "#C33D65"
        align: center
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_font_color: "#C33D65"
    hidden_fields: [nlp_results_terms.filtered_text_mention_count]
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 6
    col: 0
    width: 12
    height: 10
  - title: Count of Diagnostic Reports
    name: Count of Diagnostic Reports
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: single_value
    fields: [nlp_results.count]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#C33D65"
    single_value_title: Count of Diagnostic Reports
    series_types: {}
    defaults_version: 1
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 6
    col: 12
    width: 6
    height: 5
  - title: Count of Mentions
    name: Count of Mentions
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: single_value
    fields: [nlp_results_terms.filtered_text_mention_count, nlp_results__entity_mentions.count_unique_mentions]
    filters:
      nlp_results__entity_mentions.temporal_assessment__confidence: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#C33D65"
    single_value_title: Count of Mentions
    series_types: {}
    defaults_version: 1
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 11
    col: 12
    width: 6
    height: 5
  - title: Confidence Min
    name: Confidence Min
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: single_value
    fields: [nlp_results__entity_mentions.confidence_min]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#C33D65"
    single_value_title: Confidence Min
    series_types: {}
    defaults_version: 1
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 11
    col: 18
    width: 6
    height: 5
  - title: Confidence Max
    name: Confidence Max
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: single_value
    fields: [nlp_results__entity_mentions.confidence_max]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#C33D65"
    single_value_title: Confidence Max
    defaults_version: 1
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 6
    col: 18
    width: 6
    height: 5
  - title: Diagnostic Report Mentions Contextual Analysis Summary
    name: Diagnostic Report Mentions Contextual Analysis Summary
    model: fhir_simple_nlp
    explore: nlp_results_terms
    type: looker_grid
    fields: [nlp_results.diagnostic_report_id, nlp_results__entity_mentions.mention_id,
      nlp_results_terms.original_term, nlp_results__entities.preferred_term, nlp_results__entity_mentions.confidence,
      nlp_results__entity_mentions.subject__confidence, nlp_results__entity_mentions.subject__value,
      nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.temporal_assessment__value,
      nlp_results__entity_mentions.certainty_assessment__value, nlp_results__entity_mentions.certainty_assessment__confidence]
    filters: {}
    sorts: [nlp_results.diagnostic_report_id desc, nlp_results__entity_mentions.mention_id]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_text_format:
      nlp_results.diagnostic_report_id:
        align: center
    header_font_color: "#ffffff"
    header_background_color: "#81415B"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 35a1356a-d729-8acd-cdaf-0a5eb9646747, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#98CBCF", offset: 50},
              {color: "#23a4b2", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: [nlp_results__entity_mentions.subject__confidence,
          nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.confidence,
          nlp_results__entity_mentions.certainty_assessment__confidence]}]
    series_types: {}
    defaults_version: 1
    listen:
      Filter on Original Term: nlp_results_terms.filter_on_original_term
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Subject Value: nlp_results__entity_mentions.subject__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 16
    col: 0
    width: 24
    height: 9
  filters:
  - name: Filter on Original Term
    title: Filter on Original Term
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: fhir_simple_nlp
    explore: nlp_results_terms
    listens_to_filters: []
    field: nlp_results_terms.filter_on_original_term
  - name: Certainty Assessment Value
    title: Certainty Assessment Value
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: fhir_simple_nlp
    explore: nlp_results_terms
    listens_to_filters: [Filter on Original Term]
    field: nlp_results__entity_mentions.certainty_assessment__value
  - name: Subject Value
    title: Subject Value
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: fhir_simple_nlp
    explore: nlp_results_terms
    listens_to_filters: [Filter on Original Term]
    field: nlp_results__entity_mentions.subject__value
  - name: Temporal Assessment Value
    title: Temporal Assessment Value
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: fhir_simple_nlp
    explore: nlp_results_terms
    listens_to_filters: [Filter on Original Term]
    field: nlp_results__entity_mentions.temporal_assessment__value
