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
        crypto = Crypto()
    }

    // func importKey(privateKeyData: String) throws {
    //     try RSAUtils.addRSAPrivateKey(privateKeyData, tagName: "de.check24.private")
    // }

    // func decryptPayLoad(data: String, privkeyBase64: String) throws -> Data? {
    //     guard let payLoad = parsePayload(data), let encryptedData = payLoad.token.data(using: .utf8) else { return nil }
    //     return try RSAUtils.decryptWithRSAPrivateKey(encryptedData: encryptedData, privkeyBase64: privkeyBase64)
    // }

    func findKey() -> String {
        return crypto.findPrivateKey(label: "check24")
        // if let key = RSAUtils.getRSAKeyFromKeychain("de.check24.demo.private") {
        //     var error:Unmanaged<CFError>?
        //     if let cfdata = SecKeyCopyExternalRepresentation(key, &error) {
        //         let data: Data = cfdata as Data
        //         return data.base64EncodedString()
        //     }
        // }
        // return "not found"
        // return crypto.findKey(label: "de.check24.demo")
    }

    func generateKey() -> String {
        return crypto.generateKey(label: "check24")
    }

    func decryptPayLoad(data: String) -> String? {
        guard let payLoad = parsePayload(data) else { return nil }
        return crypto.decrypt(payLoad: payLoad)
    }

    private func parsePayload(_ data: String) -> Payload? {
        let parts = data.split(separator: ";")
        guard let version = parts.first(where: { $0.starts(with: "v=") })?.replacingOccurrences(of: "v=", with: ""),
              let label = parts.first(where: { $0.starts(with: "l=") })?.replacingOccurrences(of: "l=", with: ""),
              let b64 = parts.first(where: { $0.starts(with: "t=") })?.replacingOccurrences(of: "t=", with: "") else {
            return nil
        }
        print("version found \(version)")
        print("label found \(label)")
        print("token found \(b64)")
        return Payload(version: version, label: label, token: b64)
        // if let tokenData = Data(base64Encoded: b64) {
        // } else {
        //     return nil
        // }
    }
}
