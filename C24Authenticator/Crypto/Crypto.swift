//
//  Crypto.swift
//  C24Authenticator
//
//  Created by Yasir Turk on 24.06.22.
//

import CryptoSwift
import Foundation
import Security

struct Payload {
    let version: String
    let label: String
    let token: String
}

final class Crypto {
    func generateKey(label: String) -> String {
        if let heimdall = Heimdall(tagPrefix: label, keySize: 1024), let publicKeyData = heimdall.publicKeyDataX509() {
            return publicKeyData.base64EncodedString()
        }
        return "not generated for label \(label)"
    }

    func findPrivateKey(label: String) -> String {
        if let heimdall = Heimdall(tagPrefix: label), let pvtKeyData = heimdall.privateKeyData(X509: false) {
            return pvtKeyData.base64EncodedString()
        }
        return "not found for label \(label)"
    }

    func findKey(label: String) -> String {
        if let heimdall = Heimdall(tagPrefix: label), let pubKeyData = heimdall.publicKeyData() {
            return pubKeyData.base64EncodedString()
        }
        return "not found for label \(label)"
    }

    func decrypt(payLoad: Payload) -> String? {
        // guard let data = Data(base64Encoded: payLoad.token) else { return nil }
        // if let decrypted = try? RSAUtils.decryptWithRSAPrivateKey(encryptedData: data, privkeyBase64: findPrivateKey(label: payLoad.label), tagName: payLoad.label + ".private") {
        //     return String(data: decrypted, encoding: .utf8)
        // } else {
        //     return nil
        // }
        guard let heimdall = Heimdall(tagPrefix: payLoad.label) else { return nil }

        return heimdall.decrypt(payLoad.token, urlEncoded: false)
    }
}
