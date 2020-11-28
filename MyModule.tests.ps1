BeforeAll {
    Import-Module ".\MyModule.psd1"
}

Describe "Module" {
    It "remote is loaded" {
        Mock Write-Host {}
        Write-Remote "hi"
        Should -Invoke Write-Host -ParameterFilter { $Object -eq "remote: hi" }
    }
    It "local is loaded" {
        Mock Write-Host {}
        Write-Local "bye"
        Should -Invoke Write-Host -ParameterFilter { $Object -eq "bye" }
    }
}

AfterAll {
    Remove-Module MyModule
}