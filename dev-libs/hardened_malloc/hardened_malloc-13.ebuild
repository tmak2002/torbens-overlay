# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Hardened allocator designed for modern systems."
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"
SRC_URI="https://github.com/GrapheneOS/hardened_malloc/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="light"

src_compile() {
  emake $(usex light VARIANT=light)
}

src_install() {
  if use light; then
    dolib.so out-light/libhardened_malloc-light.so
  else
    dolib.so out/libhardened_malloc.so
  fi
}
