:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml || goto :error

:: build
set LIBCLANG_PATH="%PREFIX%\lib"
cargo install --features all_features --locked --release --root "%PREFIX%" --path . || goto :error

:: remove extra build file
del /F /Q "%PREFIX%\.crates.toml" || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
