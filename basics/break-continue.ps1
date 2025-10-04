# Break and Continue

$i = 1;
while($i -lt 5) {
    $i +=1
    if ($i -eq 3) {
        continue
    }
    Write-Host $i;
}

$i = 1;

while ($i -lt 5) {
    if ($i -eq 3) {
        break
    }
    Write-Host $i;
    $i += 1;
}

# break label

$i = 0;
:mainLoop while ($i -lt 15) {
    Write-Host $i -ForegroundColor "Cyan"
    $j = 0
    while ($j -lt 15) {
        Write-Host $j -ForegroundColor "Magenta"
        $k = $i * $j
        Write-Host $k -ForegroundColor 'Green'
        if ($k -gt 100) {
            break mainLoop
        }
        $j++
    }
    $i++
}

# Count down
# $i = 10
# while($i -eq 0) {
#     $i
#     $i--
# }

