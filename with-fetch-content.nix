{ pkgs, ... }:

pkgs.clangStdenv.mkDerivation {
  name = "test";
  src = ./.;

  nativeBuildInputs = with pkgs; [
    clang
    cmake
    ninja
  ];
  buildInputs = with pkgs; [
    nlohmann_json
  ];
  installPhase = ''
    mkdir -p $out/bin
    cp test $out/bin
    cp compile_commands.json $out
    ninja -t compdb > $out/ninja_compile_commands.json
  '';
  cmakeFlags = [
    "-DUSE_FETCH_CONTENT=ON"
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
    "-DFETCHCONTENT_FULLY_DISCONNECTED=ON"
    "-DFETCHCONTENT_SOURCE_DIR_NLOHMANN_JSON=${pkgs.nlohmann_json.src}"
  ];
}
