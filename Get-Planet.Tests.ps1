BeforeAll { 
    . .\Get-Planet.ps1
}

Describe 'Get-Planet' {
    Context 'no parameters' {
        It 'Given no parameters, it lists all 8 planets' {
            $allPlanets = Get-Planet
            $allPlanets.Count | Should -Be 8
        }
    
        It 'Earth is the third planet in our Solar System' {
            $allPlanets = Get-Planet
            $allPlanets[2].Name | Should -Be 'Earth'
        }
    }
}