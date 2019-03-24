# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
RESTRICT="mirror"

inherit mono-env msbuild versionator

DESCRIPTION="emulator of eramaker"
HOMEPAGE="https://osdn.net/projects/emuera"
MY_SRC_VER=$(replace_version_separator 1 '')
SRC_URI="https://osdn.net/dl/emuera/src${MY_SRC_VER}.zip"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug developer"


DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

S="${WORKDIR}"

pkg_setup() {
	mono-env_pkg_setup
}

src_compile() {
	emsbuild
}

src_install() {
	if use debug; then
		DIR=Debug
	else
		DIR=Release
	fi

	BUILD_OUTPUT="Emuera/bin/${DIR}"
	OUTPUT=/usr/lib/emuera
	insinto ${OUTPUT}
	doins ${BUILD_OUTPUT}/Emuera.exe

	if use developer; then
		doins ${BUILD_OUTPUT}/Emuera.pdb
	fi
}

