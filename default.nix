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
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=1"
  ];
}
