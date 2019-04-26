library(httr); library(magrittr)

# https://stackoverflow.com/questions/13559377/curl-bypass-proxy-for-localhost/37703356
httr_options("noproxy")

url <- modify_url(url = "http://localhost", port = 8080, path = "webhook")

res <- with_config(config("noproxy" = "localhost"),
                   POST(url, body = list(msg = "helloWord"), encode = "json"))

res <- POST(url, body = list(msg = "helloWord"), encode = "json")

res <- GET(url)

res <- with_config(config("noproxy" = "localhost"),
                   GET(url))

content(res, type = "application/json")


res <- with_config(config("noproxy" = "localhost"),
                   POST("http://localhost:8080/webhook", body = list(msg = "hi"), encode = "json"))
  

res <- with_config(config("noproxy" = "localhost"),
                   POST("http://localhost:8080/webhook", body = upload_file("data-raw/payload.json")))

content(res)


url <- modify_url(url = "http://35.185.116.132", path = "webhook")
res <- POST(url, body = upload_file("data-raw/payload.json"))

url <- modify_url(url = "http://35.185.116.132", path = "echo", query = list(msg = "helloWord"))
res <- GET(url)
content(res)
