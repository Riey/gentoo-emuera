# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="games-engines/emuera
	virtual/wine
	app-emulation/wine-mono"
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}"

src_install() {
	install -D -m 755 "${FILESDIR}/emuera" "${D}/usr/bin/emuera"
}

