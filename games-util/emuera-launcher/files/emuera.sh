GAME_DIR=${1:-$PWD}
TEMP_DIR=$(mktemp -d)

pushd $(TEMP_DIR)

for f in "$GAME_DIR/*"
do
    ln -s "$f" .
done

for f in /usr/lib/emuera/*
do
    ln -sf "$f" .
done

wine Emuera.exe

cp -R ./sav "$GAME_DIR"
cp ./*.sav "$GAME_DIR"

popd

rm -rf "$TEMP_DIR"

