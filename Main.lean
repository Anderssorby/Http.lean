import Http
import Cli
-- import OpenSSL

-- open OpenSSL
open Http Cli

def run (p : Parsed) : IO UInt32 := do
  try
    -- let ssl ← sslClientInit
    let surl   : String       := p.positionalArg! "url" |>.as! String
    
    if p.hasFlag "get" then
      let url ← IO.ofExcept <| URI.parse surl
      let response ← Client.get url
      println! "headers : {response.headers}"
      println! "body: {response.body}"
    else if p.hasFlag "post" then
      let body := p.flag! "body" |>.as! String
      let url ← IO.ofExcept <| URI.parse surl
      let response ← Client.post url body
      println! "headers : {response.headers}"
      println! "body: {response.body}"
    else IO.eprintln "Invalid arguments"
    return 0
  catch e =>
    IO.eprintln s!"error: {e}"
    return 1

def cmd : Cmd := `[Cli|
  http.lean VIA run; 
  "Http.lean basic HTTP functionality for lean"
  FLAGS:
    get; "Perform a GET request"
    post; "Perform a POST request"
    b, body : String; "Body of the request"
  ARGS:
    url : String; "The URL to query"
]

def main (args : List String) : IO UInt32 := do
  cmd.validate args
