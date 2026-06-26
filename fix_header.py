import sys

file_path = r'd:\Downloads\.Antigravity\소액수의 분석\소액수의 분석.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Look for the current header line
old1 = "sortTable('pjtSumTable', 6, 'str')\" title=\"\u26d4 \uace0\uc704\ud5d8 \uc815\ubc00\uac10\uc0ac: \uac74\uc218\u22653 & \uae08\uc561\u22651\uc5b5 / \u26a0\ufe0f \uc694\uc8fc\uc758: \uac74\uc218\u22652 / \u2705 \uc77c\ubc18: \uadf8 \uc678\">\uc704\ud5d8 \ub4f1\uae09</th>"
new1 = "sortTable('pjtSumTable', 6, 'str')\">\uc8fc\uc694 \ud611\ub825\uc0ac</th>\n                     <th onclick=\"sortTable('pjtSumTable', 7, 'str')\" title=\"\u26d4 \uace0\uc704\ud5d8 \uc815\ubc00\uac10\uc0ac: \uac74\uc218\u22653 & \uae08\uc561\u22651\uc5b5 / \u26a0\ufe0f \uc694\uc8fc\uc758: \uac74\uc218\u22652 / \u2705 \uc77c\ubc18: \uadf8 \uc678\">\uc704\ud5d8 \ub4f1\uae09</th>"

if old1 in content:
    content = content.replace(old1, new1, 1)
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print("SUCCESS: Column header inserted")
else:
    # Debug: find context around pjtSumTable column 6
    idx = content.find("pjtSumTable', 6")
    if idx >= 0:
        print("Found pjtSumTable col 6 at:", idx)
        print(repr(content[idx-10:idx+200]))
    else:
        print("Not found at all")
