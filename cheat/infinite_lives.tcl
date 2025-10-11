namespace eval infinitelife {
    variable after_id ""
    
    proc loop {} {
        debug write "memory" 0xCC07 0x4F
        debug write "memory" 0xCC08 0x4F
        #debug write "memory" 0xCC09 0x4F
        set infinitelife::after_id [after frame [namespace code loop]]
    }
    
    proc active {} {
        if {$infinitelife::after_id eq ""} {
            infinitelife::loop
            puts "✅ Active infinite life"
        } else {
            puts "⚠️ Infinite lives already active"
        }
    }
    
    proc disable {} {
        if {$infinitelife::after_id ne ""} {
            after cancel $infinitelife::after_id
            set infinitelife::after_id ""
            puts "❌ Infinite lives disabled"
        } else {
            puts "⚠️No active loops"
        }
    }
    
    puts "Cheat loaded. Available commands:"
    puts "infinitelife::active   → Active infinite life"
    puts "infinitelife::disable  → Infinite lives disabled"
}