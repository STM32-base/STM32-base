/**
 * Discard unused sections defined by the libc, libm, and libgcc libaries.
 */

SECTIONS {
    /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    }
}
