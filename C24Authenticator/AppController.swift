//
//  AppController.swift
//  C24Authenticator
//
//  Created by Yasir Turk on 24.06.22.
//

import Foundation

final class AppController {
    private let crypto: Crypto

    init() {
        crypto = Crypto(label: "check24")
    }

    func findKey() -> String {
        return crypto.findPrivateKey(label: "check24")
    }

    func generateKey() -> String {
        return crypto.generateKey()
    }

    func decryptPayLoad(data: String) -> String? {
        guard let payLoad = Payload(data) else { return nil }
        return crypto.decrypt(payLoad: payLoad)
    }
}
