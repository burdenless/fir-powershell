# Define the FIR class and it's components

Class FIR {
  [String]$URL
  [String]$Token

  # Constructor that creates new FIR object given
  # the URL and API token for the provided URL
  FIR ([String]URL, Token) {
    $this.URL = URL
    $this.Token = Token
    $this.headerParams = @{"Authorization"="Token $t"}
  }

  Function _get() {
    Invoke-RestMethod -URI $this.URL -Method Get -Headers $this.headerParams
  }

  Function _post() {
    Invoke-RestMethod -URI $this.URL -Method Post -Headers $this.headerParams
  }

  Function _put() {
    Invoke-RestMethod -URI $this.URL -Method Put -Headers $this.headerParams
  }

  #Function 
}
