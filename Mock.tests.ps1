BeforeAll{
    function Build ($version) {
        Write-Host "a build was run for version: $version"
    }
    
    function Get-Version{
        return 'Version'
    }
    
    function Get-NextVersion {
        return 'NextVersion'
    }
    
    function BuildIfChanged {
        $thisVersion = Get-Version
        $nextVersion = Get-NextVersion
        if ($thisVersion -ne $nextVersion) { Build $nextVersion }
        return $nextVersion
    }
}

Describe "BuildIfChanged" {
    Context "When there are Changes" {
        BeforeEach{
            Mock Get-Version {return 1.1}
            Mock Get-NextVersion {return 1.2}
            #Mock Build {} -Verifiable -ParameterFilter {$version -eq 1.2}
            Mock Build {} 
            $result = BuildIfChanged
        }

        # It "Builds the next version" {
        #     #Assert-VerifiableMock
        #     Should -InvokeVerifiable Build
        #     #Build | Should -InvokeVerifiable
        # }

        
        It "Should build the next version" {
            #Assert-MockCalled Build -Times 1 -ParameterFilter {$version -eq 1.2}
            Should -Invoke Build -Times 1 -Exactly #-ParameterFilter {$version -eq 1.2}
        }
 
        It "returns the next version number" {
            #$result | Should -Be 1.2
        }
    }
    Context "When there are no Changes" {
        BeforeEach{
            Mock Get-Version { return 1.1 }
            Mock Get-NextVersion { return 1.1 }
            Mock Build {}
    
            $result = BuildIfChanged
        }

        It "Should not build the next version" {
            Assert-MockCalled Build -Times 0 -ParameterFilter {$version -eq 1.1}
        }
    }
}