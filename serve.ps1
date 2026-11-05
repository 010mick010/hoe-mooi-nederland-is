# Serveert index.html op http://localhost:8766. YouTube speelt geen embeds af vanuit een los bestand.
param([switch]$Open)

$file = Join-Path $PSScriptRoot 'index.html'
$listener = New-Object Net.HttpListener
$listener.Prefixes.Add('http://localhost:8766/')
$listener.Start()
Write-Host 'Nederland draait op http://localhost:8766 (sluit dit venster om te stoppen)'
if ($Open) { Start-Process 'http://localhost:8766' }

try {
  while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    $res = $ctx.Response
    try {
      if ($ctx.Request.Url.AbsolutePath -eq '/') {
        $page = [IO.File]::ReadAllBytes($file)
        $res.ContentType = 'text/html; charset=utf-8'
        $res.ContentLength64 = $page.Length
        if ($ctx.Request.HttpMethod -ne 'HEAD') { $res.OutputStream.Write($page, 0, $page.Length) }
      } else {
        $res.StatusCode = 404
      }
      $res.Close()
    } catch {
      # Een verbroken verbinding mag de server niet stoppen.
      try { $res.Abort() } catch {}
    }
  }
} finally {
  $listener.Stop()
}
