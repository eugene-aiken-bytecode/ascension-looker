- dashboard: nlp__patient_view
  title: NLP - Patient View
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  elements:
  - title: Diagnostic Reports Text
    name: Diagnostic Reports Text
    model: fhir_simple_nlp
    explore: nlp_results
    type: looker_grid
    fields: [nlp_results.diagnostic_report_id, nlp_results.text_highlighted]
    filters:
      nlp_results__entity_mentions.type: PROBLEM,MEDICINE
    sorts: [nlp_results.diagnostic_report_id]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      nlp_results.diagnostic_report_id: left
    column_order: ["$$$_row_numbers_$$$", nlp_results.diagnostic_report_id, nlp_results.raw_text]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      nlp_results.diagnostic_report_id: 131
    header_font_color: "#ffffff"
    header_background_color: "#81415B"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: d3ab9972-7d33-8333-6410-ab951931a400, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#98CBCF", offset: 50},
              {color: "#23a4b2", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#12B5CB"
    single_value_title: Selected Original Term
    series_types: {}
    defaults_version: 1
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 15
    col: 8
    width: 16
    height: 9
  - title: Top 10 - Original Terms by Count
    name: Top 10 - Original Terms by Count
    model: fhir_simple_nlp
    explore: nlp_results
    type: looker_bar
    fields: [nlp_results__entity_mentions.text__content, nlp_results__entity_mentions.count_unique_mentions]
    filters:
      nlp_results__entities.preferred_term: "-NULL,-EMPTY"
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
    sorts: [nlp_results__entity_mentions.count_unique_mentions desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.count_unique_mentions: "#aad952"
    defaults_version: 1
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Selected Patient
    name: Selected Patient
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results.diagnostic_report_id]
    filters: {}
    sorts: [nlp_results.diagnostic_report_id]
    limit: 500
    column_limit: 50
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
    single_value_title: Selected Patient
    series_types: {}
    defaults_version: 1
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 0
    col: 8
    width: 8
    height: 3
  - title: New Tile
    name: New Tile
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results__entity_mentions.text__content, nlp_results__entity_mentions.confidence_mean,
      nlp_results__entity_mentions.count_unique_mentions]
    filters:
      nlp_results__entities.preferred_term: "-NULL,-EMPTY"
    sorts: [nlp_results__entity_mentions.count_unique_mentions desc, nlp_results__entity_mentions.confidence_mean
        desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{measure: list_of_original_term, based_on: nlp_results__entity_mentions.text__content,
        expression: '', label: List of Original Term, type: list, _kind_hint: measure,
        _type_hint: list}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#23ADBF"
    single_value_title: Problem or Condition/Reason for Last Visit
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.count_unique_mentions: "#aad952"
    defaults_version: 1
    hidden_fields: [nlp_results__entity_mentions.count_unique_mentions, nlp_results__entity_mentions.confidence_mean]
    note_state: collapsed
    note_display: above
    note_text: Patient's most likely problem or condition/reason for last visit, based
      on confidence > 0.80
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 3
    col: 8
    width: 8
    height: 3
  - title: Medication Mentions and Temporal Value by Confidence Tile actions
    name: Medication Mentions and Temporal Value by Confidence Tile actions
    model: fhir_simple_nlp
    explore: nlp_results
    type: looker_grid
    fields: [nlp_results__entity_mentions.temporal_assessment__value, nlp_results__entity_mentions.text__content,
      nlp_results__entity_mentions.confidence]
    filters:
      nlp_results__entity_mentions.type: MEDICINE
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
    sorts: [nlp_results__entity_mentions.confidence desc]
    limit: 500
    column_limit: 50
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
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", nlp_results__entity_mentions.text__content,
      nlp_results__entity_mentions.temporal_assessment__value, nlp_results__entity_mentions.confidence]
    show_totals: true
    show_row_totals: true
    header_font_color: "#ffffff"
    header_background_color: "#81415B"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#C33D65",
        font_color: !!null '', color_application: {collection_id: Boardwalk, palette_id: Boardwalk-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.count_unique_mentions: "#aad952"
    defaults_version: 1
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 0
    col: 16
    width: 8
    height: 15
  - title: New Tile
    name: New Tile (2)
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results.count]
    filters:
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
    limit: 500
    column_limit: 50
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
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 6
    col: 8
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (3)
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results__entity_mentions.confidence_min]
    filters:
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
    limit: 500
    column_limit: 50
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
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 9
    col: 12
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (4)
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results__entities.count_unique_mentions, nlp_results__entity_mentions.count_unique_mentions]
    filters:
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
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
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 9
    col: 8
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (5)
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results__entity_mentions.confidence_max]
    filters:
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
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
    series_types: {}
    defaults_version: 1
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 6
    col: 12
    width: 4
    height: 3
  - title: Top 10 Problems or Conditions - Original Terms by Count
    name: Top 10 Problems or Conditions - Original Terms by Count
    model: fhir_simple_nlp
    explore: nlp_results
    type: looker_bar
    fields: [nlp_results__entity_mentions.text__content, nlp_results__entity_mentions.count_unique_mentions]
    filters:
      nlp_results__entities.preferred_term: "-NULL,-EMPTY"
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
    sorts: [nlp_results__entity_mentions.count_unique_mentions desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.count_unique_mentions: "#4285F4"
    defaults_version: 1
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 6
    col: 0
    width: 8
    height: 9
  - title: Has Allergies? (Y/N)
    name: Has Allergies? (Y/N)
    model: fhir_simple_nlp
    explore: nlp_results
    type: single_value
    fields: [nlp_results__entity_mentions.mention_id, nlp_results__entity_mentions.text__content,
      nlp_results__entities.preferred_term, nlp_results__entity_mentions.confidence,
      nlp_results__entity_mentions.type_category, nlp_results__entity_mentions.subject__confidence,
      nlp_results__entity_mentions.subject__value, nlp_results__entity_mentions.temporal_assessment__confidence,
      nlp_results__entity_mentions.temporal_assessment__value, nlp_results__entity_mentions.certainty_assessment__confidence,
      nlp_results__entity_mentions.certainty_assessment__value, nlp_results__entity_mentions.has_allergies]
    filters: {}
    sorts: [nlp_results__entity_mentions.has_allergies desc, nlp_results__entity_mentions.confidence
        desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#12B5CB"
    single_value_title: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: d3ab9972-7d33-8333-6410-ab951931a400, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#98CBCF", offset: 50},
              {color: "#23a4b2", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: [nlp_results__entity_mentions.subject__confidence,
          nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.certainty_assessment__confidence,
          nlp_results__entity_mentions.confidence]}]
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", nlp_results.diagnostic_report_id, nlp_results__entity_mentions.mention_id,
      nlp_results__entity_mentions.text__content, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.type_category, nlp_results__entity_mentions.type,
      nlp_results__entity_mentions.confidence, nlp_results__entity_mentions.subject__value,
      nlp_results__entity_mentions.subject__confidence, nlp_results__entity_mentions.temporal_assessment__value,
      nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.certainty_assessment__value,
      nlp_results__entity_mentions.certainty_assessment__confidence]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    series_column_widths:
      nlp_results__entity_mentions.mention_id: 112
      nlp_results__entity_mentions.text__content: 106
      nlp_results__entity_mentions.has_allergies: 111
    series_cell_visualizations:
      nlp_results__entity_mentions.confidence:
        is_active: false
    table_theme: unstyled
    limit_displayed_rows: false
    header_font_color: "#ffffff"
    header_background_color: "#81415B"
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [nlp_results__entity_mentions.mention_id, nlp_results__entity_mentions.text__content,
      nlp_results__entities.preferred_term, nlp_results__entity_mentions.type_category,
      nlp_results__entity_mentions.subject__confidence, nlp_results__entity_mentions.subject__value,
      nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.temporal_assessment__value,
      nlp_results__entity_mentions.certainty_assessment__confidence, nlp_results__entity_mentions.certainty_assessment__value,
      nlp_results__entity_mentions.confidence]
    note_state: collapsed
    note_display: below
    note_text: Patient currently has a likelihood of allergies with a confidence >
      0.60
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 12
    col: 8
    width: 8
    height: 3
  - title: Google Relevant Codes
    name: Google Relevant Codes
    model: fhir_simple_nlp
    explore: nlp_results
    type: looker_grid
    fields: [nlp_results__entities.entity_id, nlp_results__entities.preferred_term,
      nlp_results__entities__vocabulary_codes.vocab_codes_linked, nlp_results__entities__vocabulary_codes.vocabulary]
    filters:
      nlp_results__entities.preferred_term: "-NULL,-EMPTY"
    sorts: [nlp_results__entities.entity_id]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", nlp_results__entity_mentions.text__content,
      nlp_results__entity_mentions.temporal_assessment__value, nlp_results__entity_mentions.confidence]
    show_totals: true
    show_row_totals: true
    header_font_color: "#ffffff"
    header_background_color: "#81415B"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#C33D65",
        font_color: !!null '', color_application: {collection_id: Boardwalk, palette_id: Boardwalk-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      nlp_results__entity_mentions.count_unique_mentions: "#aad952"
    defaults_version: 1
    hidden_fields: [raw_nlp_results__entities.entity_id]
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 15
    col: 0
    width: 8
    height: 9
  - title: Diagnostic Report Mentions Contextual Analysis Summary
    name: Diagnostic Report Mentions Contextual Analysis Summary
    model: fhir_simple_nlp
    explore: nlp_results
    type: looker_grid
    fields: [nlp_results.diagnostic_report_id, nlp_results__entity_mentions.mention_id,
      nlp_results__entity_mentions.text__content, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.confidence, nlp_results__entity_mentions.type_category,
      nlp_results__entity_mentions.type, nlp_results__entity_mentions.subject__confidence,
      nlp_results__entity_mentions.subject__value, nlp_results__entity_mentions.temporal_assessment__confidence,
      nlp_results__entity_mentions.temporal_assessment__value, nlp_results__entity_mentions.certainty_assessment__confidence,
      nlp_results__entity_mentions.certainty_assessment__value]
    filters:
      nlp_results__entity_mentions.confidence_percent: "[0, 100]"
    sorts: [nlp_results.diagnostic_report_id desc, nlp_results__entity_mentions.mention_id]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", nlp_results.diagnostic_report_id, nlp_results__entity_mentions.mention_id,
      nlp_results__entity_mentions.text__content, nlp_results__entities.preferred_term,
      nlp_results__entity_mentions.type_category, nlp_results__entity_mentions.type,
      nlp_results__entity_mentions.confidence, nlp_results__entity_mentions.subject__value,
      nlp_results__entity_mentions.subject__confidence, nlp_results__entity_mentions.temporal_assessment__value,
      nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.certainty_assessment__value,
      nlp_results__entity_mentions.certainty_assessment__confidence]
    show_totals: true
    show_row_totals: true
    series_labels:
      nlp_results__entity_mentions.mention_id: ID
    series_column_widths:
      nlp_results__entity_mentions.mention_id: 125
    series_cell_visualizations:
      nlp_results__entity_mentions.confidence:
        is_active: false
    header_font_color: "#ffffff"
    header_background_color: "#81415B"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: d3ab9972-7d33-8333-6410-ab951931a400, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#98CBCF", offset: 50},
              {color: "#23a4b2", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: [nlp_results__entity_mentions.subject__confidence,
          nlp_results__entity_mentions.temporal_assessment__confidence, nlp_results__entity_mentions.certainty_assessment__confidence,
          nlp_results__entity_mentions.confidence]}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#12B5CB"
    single_value_title: Selected Original Term
    series_types: {}
    defaults_version: 1
    hidden_fields: [nlp_results__entity_mentions.type, nlp_results.diagnostic_report_id]
    listen:
      Original Term: nlp_results__entity_mentions.text__content
      Subject Value: nlp_results__entity_mentions.subject__value
      Term Type Category: nlp_results__entity_mentions.type_category
      Confidence: nlp_results__entity_mentions.confidence
      Diagnostic Report ID: nlp_results.diagnostic_report_id
      Certainty Assessment Value: nlp_results__entity_mentions.certainty_assessment__value
      Temporal Assessment Value: nlp_results__entity_mentions.temporal_assessment__value
    row: 24
    col: 0
    width: 24
    height: 10
  filters:
  - name: Diagnostic Report ID
    title: Diagnostic Report ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: fhir_simple_nlp
    explore: nlp_results
    listens_to_filters: [Certainty Assessment Value, Temporal Assessment Value, Original
        Term, Subject Value]
    field: nlp_results.diagnostic_report_id
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
    explore: nlp_results
    listens_to_filters: [Diagnostic Report ID, Temporal Assessment Value, Original
        Term, Subject Value, Term Type Category]
    field: nlp_results__entity_mentions.certainty_assessment__value
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
    explore: nlp_results
    listens_to_filters: [Certainty Assessment Value, Diagnostic Report ID, Original
        Term, Subject Value, Term Type Category]
    field: nlp_results__entity_mentions.temporal_assessment__value
  - name: Original Term
    title: Original Term
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: fhir_simple_nlp
    explore: nlp_results
    listens_to_filters: []
    field: nlp_results__entity_mentions.text__content
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
    explore: nlp_results
    listens_to_filters: []
    field: nlp_results__entity_mentions.subject__value
  - name: Term Type Category
    title: Term Type Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: fhir_simple_nlp
    explore: nlp_results
    listens_to_filters: []
    field: nlp_results__entity_mentions.type_category
  - name: Confidence
    title: Confidence
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: fhir_simple_nlp
    explore: nlp_results
    listens_to_filters: []
    field: nlp_results__entity_mentions.confidence
