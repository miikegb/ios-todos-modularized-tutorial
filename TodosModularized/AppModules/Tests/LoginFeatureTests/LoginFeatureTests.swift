@testable import LoginFeature
import Testing

@Suite
struct LoginFeatureTestsTests {
    @Test("LoginFeatureTests tests")
    func example() {
        #expect(42 == 17 + 25)
    }
    
    @Test func sumFunction() async throws {
        let login = LoginFeature()
        #expect(login.sum(a: 3, b: 5) == 8)
    }
}
