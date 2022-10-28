/**
 *
 */
SECTIONS {
    /* STABS Debugging sections */
    .stab            0 : { *(.stab) }
    .stabstr         0 : { *(.stabstr) }
    .stab.excl       0 : { *(.stab.excl) }
    .stab.exclstr    0 : { *(.stab.exclstr) }
    .stab.index      0 : { *(.stab.index) }
    .stab.indexstr   0 : { *(.stab.indexstr) }
    .comment         0 : { *(.comment) }

    /* DWARF 1 Debugging sections */
    .debug           0 : { *(.debug) }
    .line            0 : { *(.line) }

    /* GNU DWARF 1 extensions */
    .debug_srcinfo   0 : { *(.debug_srcinfo) }
    .debug_sfnames   0 : { *(.debug_sfnames) }

    /* DWARF 1.1 and DWARF 2 Debugging sections */
    .debug_aranges   0 : { *(.debug_aranges) }
    .debug_pubnames  0 : { *(.debug_pubnames) }

    /* DWARF 2 Debugging sections */
    .debug_info      0 : { *(.debug_info) }
    .debug_abbrev    0 : { *(.debug_abbrev) }
    .debug_line      0 : { *(.debug_line) }
    .debug_frame     0 : { *(.debug_frame) }
    .debug_str       0 : { *(.debug_str) }
    .debug_loc       0 : { *(.debug_loc) }
    .debug_macinfo   0 : { *(.debug_macinfo) }
    .debug_ranges    0 : { *(.debug_ranges) }

    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }

    /* ARM build attributes */
    .ARM.attributes  0 : { *(.ARM.attributes) }
}
