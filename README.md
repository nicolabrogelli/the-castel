# the-castel
The Castel is based on the MSXgl library which you can find at this address: https://github.com/aoineko-fr/MSXgl. It is inspired by the game Room5, in many of its functions. But implementing the game lifecycle management modes provided by the Template example provided by the library. which you can find at this address: https://github.com/Asso-MO5/room5

Thanks.

Impostazioni del progetto. Prima di scaricare il gioco creare una cartella dove dovrà essere copiata la libreia MSXgl, allo stesso livello di questa cartella
clonare il progetto. Una volta completata l'operazione sarà possibile effettuare la build. Se riscontrate problemi in fase di compilazioni, effettuate una
segbalazione e provvedeò a dare assistenza.


Grazie a tutti e buon divertimento


Nicola Brogelli


## Grafica V9990 (GFX9000)

Il gioco richiede la scheda video **V9990 / GFX9000** (modo P1, 16 colori per tile e per sprite).
Senza la scheda compare il messaggio `GFX9000 REQUIRED`.

Tutta la grafica (stile arcade anni '80) è generata da `tools/arcade_art.py`, dove ogni
tile e sprite è disegnato in ASCII art o in modo procedurale:

```
python tools/arcade_art.py       # rigenera i PNG in data/v9990/
python tools/v9990_gfx.py convert # PNG -> header C
build.bat
```

In alternativa si possono ritoccare direttamente i PNG di `data/v9990/` con Aseprite (modalità
indicizzata) e lanciare solo `convert` (non rilanciare `arcade_art.py`, che li sovrascrive):

- `tiles.png` – 256 tile 8x8, indici 0-15. Riservati: 1 nero, 2-4 mattoni (ricolorati per livello
  secondo `palette.json`), 5-7 acqua e 8-10 lava/fiamme (colori che ruotano).
- `sprites.png` – celle 16x16, palette 1 (indici 16-31, giocatore) e 2 (32-47, nemici);
  l'indice 0 di ogni palette è trasparente.
- `background.png` – fondale 256x192 dietro al livello (layer B), indici 0-15.
- `sprites.json` – celle per ogni animazione del giocatore e dei nemici (`right`/`left`).
