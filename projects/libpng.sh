version="1.6.41"

prepare() {
    fetch-http \
        "http://prdownloads.sourceforge.net/libpng/libpng-${version}.tar.xz" \
        "d6a49a7a4abca7e44f72542030e53319c081fea508daccf4ecc7c6d9958d190f"

    tar xf "libpng-${version}.tar.xz"

    cd "libpng-${version}"
}

configure() {
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX="$PREFIX" \
        -DPNG_STATIC=ON \
        -DPNG_SHARED=OFF \
        "../libpng-${version}"
}

build() {
    make -C build -j "$(nproc)"
}

install() {
    make -C build install
}