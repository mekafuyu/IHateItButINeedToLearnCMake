mkdir -p "./$1/build_unix"

cmake -DGLFW_BUILD_DOCS=OFF -S "./$1" -B "./$1/build_unix"