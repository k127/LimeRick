#' @export
#'
ls_setFieldTypes = function(data, config) {

  for (.col_name in names(config)) {

    .data_type = config[.col_name]

    if (.col_name %in% colnames(data)) {
      if (.data_type == "datetime") {

        data[,.col_name] <- as.Date(data[,.col_name], format = fmt_dttm)

      } else if (.data_type == "factor") {

        data[,.col_name] <- as.factor(data[,.col_name])

      } else if (.data_type == "integer") {

        data[,.col_name] <- as.integer(data[,.col_name])

      } else if (.data_type == "character") {

        data[,.col_name] <- as.character(data[,.col_name])

      } else stop(paste("Unhandled data type:", .data_type))

      } else message(paste("Column not found in data:", .col_name))
  }

  data
}

ls_fmt_dttm <- "%Y-%m-%d %H:%M:%S"
