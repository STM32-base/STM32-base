SECTIONS {
    /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    }
}
