BeforeAll {
    . ".\Write-Remote.ps1"
}
Describe "Write-Remote" {
    It "does a remote write" {
        Mock Write-Host {}

        Write-Remote "bye"

        Should -Invoke "Write-Host" -ParameterFilter { $Object -eq "remote: bye" }
    }
}
