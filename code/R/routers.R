#* Homepage
#* @get /
function() {
    list(data = "API endpoint up and running...")
}

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
  list(msg = paste0("The message is:", msg))
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  as.numeric(a) + as.numeric(b)
}

#* Logs push payload to file
#* @param payload
#* @post /webhook
function(actor, repository, push) {
  
  sink(file = "log.Rout", append = TRUE)
  timestamp()
  print(sessionInfo())
  print(cli::rule(left = "Results", width = 60))
  print(jsonlite::toJSON(actor, pretty = TRUE))
  print(jsonlite::toJSON(repository, pretty = TRUE))
  print(jsonlite::toJSON(push, pretty = TRUE))
  sink()
  
}
