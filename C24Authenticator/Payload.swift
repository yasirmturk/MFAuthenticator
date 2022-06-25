//
//  Payload.swift
//  C24Authenticator
//
//  Created by Yasir Turk on 25.06.22.
//

import Foundation

struct Payload {
    let version: String
    let label: String
    let token: String
}

extension Payload {
    init?(_ data: String) {
        let parts = data.split(separator: ";")
        guard let version = parts.first(where: { $0.starts(with: "v=") })?.replacingOccurrences(of: "v=", with: ""),
              let label = parts.first(where: { $0.starts(with: "l=") })?.replacingOccurrences(of: "l=", with: ""),
              let b64 = parts.first(where: { $0.starts(with: "t=") })?.replacingOccurrences(of: "t=", with: "") else {
            return nil
        }
        print("version found \(version)")
        print("label found \(label)")
        print("token found \(b64)")
        self.init(version: version, label: label, token: b64)
    }
}
