# mygame-trainer.tcl
trainer add "Vite infinite" {
    # Mantiene il valore 3 all'indirizzo 0xC020 ogni frame
    debug set_watchpoint write_io 0xCC07 {
        poke 0xCC07 4F
    }
}
