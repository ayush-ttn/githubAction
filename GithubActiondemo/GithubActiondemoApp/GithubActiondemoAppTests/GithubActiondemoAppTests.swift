//
//  GithubActiondemoAppTests.swift
//  GithubActiondemoAppTests
//
//  Created by Ayush Awasthi on 05/02/25.
//

import Testing
@testable import GithubActiondemoApp

struct GithubActiondemoAppTests {
    
    @MainActor
    @Test func checkIntegration() {
        let vc = ViewController()
        vc.loadViewIfNeeded()
        vc.testFramework()
        #expect(true)
    }

}
