version=2.13.2

prepare() {
    fetch-archive \
        "https://gitlab.freedesktop.org/freetype/freetype/-/archive/VER-2-13-2/freetype-VER-2-13-2.tar.gz" \
        "427201f5d5151670d05c1f5b45bef5dda1f2e7dd971ef54f0feaaa7ffd2ab90c"
}

configure() {
    cd freetype-VER-2-13-2
    meson setup \
        --reconfigure \
        --prefix="$PREFIX" \
        -Ddefault_library=static \
        -Dbzip2=disabled \
        -Dbrotli=disabled \
        ../build
}

build() {
    meson compile -C build
}

install() {
    meson install -C build
}
