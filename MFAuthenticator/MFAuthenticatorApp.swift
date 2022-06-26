//
//  MFAuthenticatorApp.swift
//  MFAuthenticator
//
//  Created by Yasir Turk on 24.06.22.
//

import SwiftUI

@main
struct MFAuthenticatorApp: App {
    private let controller: AppController

    init() {
        controller = AppController()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
