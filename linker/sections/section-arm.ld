SECTIONS {
    .ARM.extab : {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > ARM_EXTAB

    .ARM : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } > ARM_EXIDX
}
