variable "policy_name_module" {
  type = string
}
variable "alert_module" {
  type = any
}
# variable "alert_module" {
#   type = map(object({
#     key                            = string
#     type                           = string
#     baseline_direction             = string
#     description                    = string
#     runbook_url                    = string
#     enabled                        = bool
#     violation_time_limit_seconds   = number
#     fill_option                    = string
#     fill_value                     = number
#     aggregation_window             = number
#     aggregation_method             = string
#     aggregation_delay              = number
#     expiration_duration            = number
#     open_violation_on_expiration   = bool
#     close_violations_on_expiration = bool
#     slide_by                       = number
#     nrql_query                     = string
#     operator                       = string
#     critical_threshold             = number
#     critical_duration              = number
#     threshold_occurrences          = string
#     warning_enabled                = bool

#     warning = any
#   }))
# }
