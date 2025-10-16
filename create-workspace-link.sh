#!/bin/bash

# customized.code-workspace 파일을 상위 폴더로 심볼릭 링크 생성 스크립트
# ln -sf "$(pwd)/customized.code-workspace" ../autotest_cs.code-workspace

echo "=========================================="
echo "Workspace Link Creator"
echo "=========================================="

# 현재 디렉토리로 이동 (.vscode 폴더에서 실행)
cd "$(dirname "${BASH_SOURCE[0]}")"

# 상위 폴더 이름을 동적으로 가져오기
PARENT_FOLDER_NAME=$(basename "$(dirname "$(pwd)")")

# 소스 파일이 존재하는지 확인
if [ ! -f "customized.code-workspace" ]; then
    echo "❌ Error: customized.code-workspace 파일을 찾을 수 없습니다."
    echo "현재 디렉토리: $(pwd)"
    exit 1
fi

echo "현재 디렉토리: $(pwd)"
echo "상위 폴더 이름: $PARENT_FOLDER_NAME"
echo "소스 파일: $(pwd)/customized.code-workspace"
echo "링크 대상: ../${PARENT_FOLDER_NAME}.code-workspace"
echo ""

# 심볼릭 링크 생성 (강제로 덮어쓰기)
echo "심볼릭 링크를 생성합니다..."
if ln -sf "$(pwd)/customized.code-workspace" "../${PARENT_FOLDER_NAME}.code-workspace"; then
    echo "✅ 심볼릭 링크가 성공적으로 생성되었습니다:"
    echo "   ../${PARENT_FOLDER_NAME}.code-workspace -> $(pwd)/customized.code-workspace"
    echo ""
    echo "상위 폴더에서 워크스페이스를 열 수 있습니다:"
    echo "   code ../${PARENT_FOLDER_NAME}.code-workspace"
else
    echo "❌ Error: 심볼릭 링크 생성에 실패했습니다."
    exit 1
fi

echo ""
echo "=========================================="
echo "링크 생성 완료!"
echo "=========================================="
