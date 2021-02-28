@set SETUP_MSVC_2019="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat"
if not exist %SETUP_MSVC_2019% (
	@set SETUP_MSVC_2019="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
)

@REM TO-DO: download http://www.nasm.us/pub/nasm/releasebuilds/2.12.02/win32/nasm-2.12.02-win32.zip
#SET NASM=%cd%\nasm.exe
SET NASM=C:/build/nasm.exe
SET YASM=C:/build/vcpkg/downloads/tools/yasm/1.3.0.6/yasm.exe
SET MSYS_ROOT=C:/build/vcpkg/downloads/tools/msys2/707c9e50a7507d11
SET PATH=%PATH%;%MSYS_ROOT%/usr/bin
SET GAS=%MSYS_ROOT%/usr/bin/as

call %SETUP_MSVC_2019%

if NOT exist build (
	cmake -G "Visual Studio 16 2019" -A x64 -DBLASFEO_HP_API=ON -DBLASFEO_BENCHMARKS=OFF -DBLASFEO_EXAMPLES=OFF -DBLASFEO_TESTING=OFF -DTARGET=X64_AUTOMATIC -DGAS=%GAS% -DYASM=%YASM% -Bbuild -S.
)
