#!/bin/bash

declare extra_configure_flags='--with-cpu=cortex-a8 --with-fpu=neon --with-float=softfp --with-mode=thumb'

declare triplet='arm-kobo-linux-gnueabihf'

declare sysroot='https://web.archive.org/web/0if_/https://github.com/koreader/koxtoolchain/releases/latest/download/kobo.zip'
