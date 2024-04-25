

resource "newrelic_alert_policy" "policy" {
  name = var.policy_name_module
}

resource "newrelic_nrql_alert_condition" "rkcondition_tarraform" {
  for_each                       = var.alert_module
  policy_id                      = newrelic_alert_policy.policy.id
  name                           = each.value.key
  type                           = each.value.type
  baseline_direction             = each.value.baseline_direction
  description                    = each.value.description
  runbook_url                    = each.value.runbook_url
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by

  nrql {
    query = each.value.nrql_query
  }


  critical {
    operator              = each.value.operator
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_duration
    threshold_occurrences = each.value.threshold_occurrences
  }


  dynamic "warning" {
    for_each = each.value.warning_enabled ? [each.value] : []
    content {
      operator              = each.value.warning.operator
      threshold             = each.value.warning.warning_threshold
      threshold_duration    = each.value.warning.warning_duration
      threshold_occurrences = each.value.warning.threshold_occurrences
    }
  }
}
