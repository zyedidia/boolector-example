git clone https://github.com/Boolector/boolector
cd boolector
./contrib/setup-lingeling.sh
./contrib/setup-btor2tools.sh
./configure.sh && cd build && make

cd ..

mkdir ../deps
cp -r deps/install/include ../deps
cp -r deps/install/lib ../deps
cp -r build/lib/* ../deps/lib
cp src/boolector.h ../deps/include
cp src/btortypes.h ../deps/include
