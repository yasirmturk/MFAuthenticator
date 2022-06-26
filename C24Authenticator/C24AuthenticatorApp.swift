//
//  C24AuthenticatorApp.swift
//  C24Authenticator
//
//  Created by Yasir Turk on 24.06.22.
//

import SwiftUI

@main
struct C24AuthenticatorApp: App {
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
