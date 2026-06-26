$filePath = 'd:\Downloads\.Antigravity\소액수의 분석\소액수의 분석.html'
$content = Get-Content $filePath -Raw -Encoding UTF8

$oldHeader = "<th onclick=`"sortTable('pjtSumTable', 5, 'str')`">주요 업무구분</th>`r`n                     <th onclick=`"sortTable('pjtSumTable', 6, 'str')`" title=`"⛔ 고위험 정밀감사: 건수≥3 & 금액≥1억 / ⚠️ 요주의: 건수≥2 / ✅ 일반: 그 외`">위험 등급</th>"
$newHeader = "<th onclick=`"sortTable('pjtSumTable', 5, 'str')`">주요 업무구분</th>`r`n                     <th onclick=`"sortTable('pjtSumTable', 6, 'str')`">주요 협력사</th>`r`n                     <th onclick=`"sortTable('pjtSumTable', 7, 'str')`" title=`"⛔ 고위험 정밀감사: 건수≥3 & 금액≥1억 / ⚠️ 요주의: 건수≥2 / ✅ 일반: 그 외`">위험 등급</th>"

if ($content.Contains($oldHeader)) {
    $content = $content.Replace($oldHeader, $newHeader)
    [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
    Write-Host "SUCCESS: Header updated"
} else {
    Write-Host "NOT FOUND - trying LF line endings"
    $oldHeader2 = "<th onclick=`"sortTable('pjtSumTable', 5, 'str')`">주요 업무구분</th>`n                     <th onclick=`"sortTable('pjtSumTable', 6, 'str')`" title=`"⛔ 고위험 정밀감사: 건수≥3 & 금액≥1억 / ⚠️ 요주의: 건수≥2 / ✅ 일반: 그 외`">위험 등급</th>"
    $newHeader2 = "<th onclick=`"sortTable('pjtSumTable', 5, 'str')`">주요 업무구분</th>`n                     <th onclick=`"sortTable('pjtSumTable', 6, 'str')`">주요 협력사</th>`n                     <th onclick=`"sortTable('pjtSumTable', 7, 'str')`" title=`"⛔ 고위험 정밀감사: 건수≥3 & 금액≥1억 / ⚠️ 요주의: 건수≥2 / ✅ 일반: 그 외`">위험 등급</th>"
    if ($content.Contains($oldHeader2)) {
        $content = $content.Replace($oldHeader2, $newHeader2)
        [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
        Write-Host "SUCCESS: Header updated (LF)"
    } else {
        Write-Host "STILL NOT FOUND"
        # Show the relevant lines
        $lines = $content -split "`n"
        $lines | Select-String "pjtSumTable" | Select-Object -First 20
    }
}
