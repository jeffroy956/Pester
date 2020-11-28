BeforeAll {
    . ".\Write-Local.ps1"
}

Describe 'writes to console' {

    It "says hi" {
        Mock Write-Host {}
        Write-Local "hi"

        Should -Invoke "Write-Host" -ParameterFilter { $Object -eq "hi" } -Exactly 1
    }
}

