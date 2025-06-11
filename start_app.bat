@echo off
chcp 932
echo ========================================
echo ���J�j�Y�����L�v���b�g�t�H�[���N����...
echo ========================================

REM ���݂̃f�B���N�g����ۑ�
set ORIGINAL_DIR=%CD%

@REM REM �o�b�N�G���h�̉��z�����m�F�E�쐬
@REM echo.
@REM echo [0/4] �o�b�N�G���h�̉��z�����m�F��...
@REM cd /d "%~dp0"
@REM if not exist ".venv" (
@REM     echo ���z����������܂���B.venv ���쐬���܂�...
@REM     uv venv .venv
@REM     if %ERRORLEVEL% NEQ 0 (
@REM         echo �G���[: ���z���̍쐬�Ɏ��s���܂����B
@REM         pause
@REM         exit /b 1
@REM     )
@REM     echo ���z���̍쐬���������܂����B
@REM ) else (
@REM     echo ���z���͊��ɑ��݂��܂��B
@REM )

@REM REM �o�b�N�G���h�̈ˑ��֌W���C���X�g�[���i����̂݁j
@REM echo.
@REM echo [1/4] �o�b�N�G���h�̈ˑ��֌W���m�F��...
@REM cd /d "%~dp0"
@REM if not exist "requirements_installed.flag" (
@REM     echo �o�b�N�G���h�̈ˑ��֌W���C���X�g�[����...
@REM     REM ���z����L����
@REM     call .venv\Scripts\activate
@REM     uv pip install -r backend\requirements.txt
@REM     if %ERRORLEVEL% EQU 0 (
@REM         echo. > requirements_installed.flag
@REM         echo �o�b�N�G���h�̈ˑ��֌W�̃C���X�g�[�����������܂����B
@REM     ) else (
@REM         echo �G���[: �o�b�N�G���h�̈ˑ��֌W�̃C���X�g�[���Ɏ��s���܂����B
@REM         pause
@REM         exit /b 1
@REM     )
@REM ) else (
@REM     echo �o�b�N�G���h�̈ˑ��֌W�͊��ɃC���X�g�[���ς݂ł��B
@REM )

@REM REM �t�����g�G���h�̈ˑ��֌W���C���X�g�[���i����̂݁j
@REM echo.
@REM echo [2/4] �t�����g�G���h�̈ˑ��֌W���m�F��...
@REM cd /d "%~dp0\frontend"
@REM if not exist "node_modules" (
@REM     echo �t�����g�G���h�̈ˑ��֌W���C���X�g�[����...
@REM     npm install
@REM     if %ERRORLEVEL% NEQ 0 (
@REM         echo �G���[: �t�����g�G���h�̈ˑ��֌W�̃C���X�g�[���Ɏ��s���܂����B
@REM         pause
@REM         exit /b 1
@REM     )
@REM     echo �t�����g�G���h�̈ˑ��֌W�̃C���X�g�[�����������܂����B
@REM ) else (
@REM     echo �t�����g�G���h�̈ˑ��֌W�͊��ɃC���X�g�[���ς݂ł��B
@REM )

@REM REM �v���W�F�N�g���[�g�ɖ߂�
@REM cd /d "%~dp0"

@REM REM �f�[�^�x�[�X�}�C�O���[�V�������s
@REM echo.
@REM echo [3/4] �f�[�^�x�[�X�}�C�O���[�V���������s��...
@REM ".venv\Scripts\alembic.exe" upgrade head
@REM if %ERRORLEVEL% NEQ 0 (
@REM     echo �x��: �f�[�^�x�[�X�}�C�O���[�V�����ŃG���[���������܂����B
@REM     echo �f�[�^�x�[�X���������ݒ肳��Ă��邩�m�F���Ă��������B
@REM     echo ���s���܂����H (Y/N)
@REM     set /p CONTINUE=
@REM     if /i not "%CONTINUE%"=="Y" (
@REM         pause
@REM         exit /b 1
@REM     )
@REM )

REM �o�b�N�G���h�T�[�o�[���N���i�o�b�N�O���E���h�j
echo.
echo [4/4] �T�[�o�[���N����...
echo �o�b�N�G���h�T�[�o�[���N�����Ă��܂�...
call .venv\Scripts\activate
start "Backend Server" cmd /c "uvicorn backend.app.main:app --reload"

REM �����ҋ@���Ă���t�����g�G���h���N��
timeout /t 3 /nobreak >nul

echo �t�����g�G���h�T�[�o�[���N�����Ă��܂�...
cd /d "%~dp0\frontend"
start "Frontend Server" cmd /c "npm start"

REM ���̃f�B���N�g���ɖ߂�
cd /d "%ORIGINAL_DIR%"

echo.
echo ========================================
echo �A�v���P�[�V�������N�����܂����I
echo ========================================
echo.
echo �A�N�Z�X��:
echo - �t�����g�G���h: http://localhost:3000
echo - �o�b�N�G���hAPI: http://localhost:8000
echo - API �h�L�������g: http://localhost:8000/docs
echo.
echo �T�[�o�[���~����ɂ́A�e�^�[�~�i���E�B���h�E�� Ctrl+C �������Ă��������B
echo.
echo �u���E�U�������ŊJ���Ȃ��ꍇ�́A�蓮�� http://localhost:3000 �ɃA�N�Z�X���Ă��������B
echo.
pause
