# 설정 파일 저장소

## 자주 쓰는 것들
- 새 설정 등록: `chezmoi add {{path-of-dotfile}}`
- 기존 설정 편집: `chezmoi edit {{path-of-dotfile}}`
- (기기별분리) 설정을 템플릿으로 변경: `chezmoi add --template {{path-of-dotfile}}`
- 템플릿 파일 편집 예시:
```
local wezterm = require 'wezterm'
local config = {}

{{ if eq .location "home" -}}
config.font_size = 14.0
{{ else -}}
config.font_size = 11.0
{{ end -}}

return config
```
- 변경사항 적용: `chezmoi apply`

## 다른 컴퓨터에서 세팅
### 1. chezmoi 설치 및 동기화
```bash
scoop install chezmoi
chezmoi init --apply https://github.com/{{repository-path}}
```
### 2. 변수 설정
```bash
chezmoi edit-config
```
```text
[edit]
    command = "vim"
[data]
    location = "office"
```
```bash
chezmoi apply
```

## 맨땅 최초 세팅
순서가 역순이지만, 자주 볼 일이 없으니 구석탱이로
### 1. scoop 설치
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

### 2. chezmoi 설치 및 초기화
```bash
scoop install chezmoi
chezmoi init
```

### 3. github로 동기화 준비
```bash
chezmoi cd
git remote add origin # 중략
git push origin main # 중략
```
