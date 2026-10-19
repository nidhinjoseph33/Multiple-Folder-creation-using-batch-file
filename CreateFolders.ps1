$ErrorActionPreference = 'Stop'

$target = 'C:\Users\USER\Desktop\coinonia'
$excelFile = Join-Path $target 'Book1.xlsx'

try {
    Write-Host 'Checking Excel file...' -ForegroundColor Cyan

    if (!(Test-Path -LiteralPath $excelFile)) {
        throw "Excel file not found: $excelFile"
    }

    Write-Host 'Starting Excel...' -ForegroundColor Cyan
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $workbook = $excel.Workbooks.Open($excelFile, 0, $true)
    $sheet = $workbook.Worksheets.Item(1)

    Write-Host 'Reading Column A...' -ForegroundColor Cyan

    $used = $sheet.UsedRange
    $lastRow = $used.Row + $used.Rows.Count - 1
    $created = 0

    for ($row = 1; $row -le $lastRow; $row++) {
        $name = [string]$sheet.Cells.Item($row, 1).Value2
        if ([string]::IsNullOrWhiteSpace($name)) { continue }

        $name = $name.Trim()
        $path = Join-Path $target $name

        if (!(Test-Path -LiteralPath $path)) {
            New-Item -ItemType Directory -Path $path | Out-Null
            Write-Host "Created: $name" -ForegroundColor Green
            $created++
        } else {
            Write-Host "Already exists: $name" -ForegroundColor Yellow
        }
    }

    Write-Host "`nCompleted. New folders created: $created" -ForegroundColor Cyan
}
catch {
    Write-Host "`nERROR: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    if ($workbook) { $workbook.Close($false) }
    if ($excel) { $excel.Quit() }
}

Read-Host 'Press Enter to close'