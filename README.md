# Hoe mooi Nederland is

Een webpagina met 22 livewebcams van YouTube, van de Dam tot de Waddeneilanden. De schermen wisselen willekeurig elke 18 tot 40 seconden.

## Bediening

- **Wissel nu** (rood) springt meteen naar een andere plek.
- **Pauze** (blauw) zet het wisselen stil.
- Klik op een klein scherm of op een plek in de lijst om die groot in beeld te zetten.

## Lokaal draaien

Dubbelklik op `Start Nederland.cmd` (Windows). De pagina opent dan op http://localhost:8766. Het bestand `index.html` los openen werkt niet, omdat YouTube dan niets afspeelt.

## Streams aanpassen

De lijst staat bovenaan het script in `index.html`, in `CAMS`. Elke regel bevat de video-ID van een YouTube-livestream. Valt een stream uit, dan slaat de pagina hem over en probeert hem later opnieuw. Start een kanaal een nieuwe video, dan moet de ID worden vervangen.

De streams zijn van hun eigen makers en worden via de YouTube-speler getoond. De lijst is voor het laatst gecontroleerd op 5 november 2026.
