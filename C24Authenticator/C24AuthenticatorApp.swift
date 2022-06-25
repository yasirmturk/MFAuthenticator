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
        let key = controller.generateKey()
        print("key is \(key)")

        // Testing

//         let privkeyBase64 = """
// -----BEGIN RSA PRIVATE KEY-----
// MIICXAIBAAKBgQDFvtqTb1ONb2Fv355QCBLizN4Nlaz/jiO1xNi2RCT6Z4UpJnDS
// xmvrpv30W1U5X1pwPXZSStOH0COnEETWMRAi0v+Bs5JrqlB8SPR+AuFe+P/wk+qR
// o8w35HHXsbT8FLj/60bQE4pGFJZSdGpy3KoGLqPQvveX8t+i9pfoVawgZQIDAQAB
// AoGADUXtR/4t/o1eXfMFnlucYOrdcM3+Kb0xum63GSzjyocOUh/JbOxyrAOugitr
// QgmbeXM2sPliz3fyHLGj3Ti323BFFBC9ne4jo7uUwlnWQRPGfeFXgJNcO3lJq+J8
// dcGng8yQ/a1SlKIl9ziLZxFRD6qK6IiHPFOiu3BkyW5a5WECQQDxNlDTyqAUwDtx
// YxrEuCYMM9o+a4F8rexfwzeZlIBMvLagzzkiqr/AFtbZiiN44C1XZOB0UOjQxugA
// fkyewn0NAkEA0d5auharLwyB1UUKK3H4niSBbCuO2fZ/ziyMpd61gQeqh7NXfXUW
// q2gRIvVIbDggrTISt7jZcs9IqK/+lGJKuQJBANMVTCA69mGSY7JzHq6905XkHn13
// SMZZ0TtwM4yzlp8QmeUZ0o8Sy2CG3BdcunQCAcuz3HQNhd+F4Orlm5lm61UCQHno
// dMFF67hPxpdRHGAyOx35zKg+ASQBeSoVXLn5TWufPWLIPZkly75TnCi3XJNoYyrY
// PGE2YjG70NQUL4iYNBkCQD5sb7DwFxiFPrerqY88VHq/1uKlIxTG8BWU/OMjf+py
// SJzbyzN/OXq4uV2Nezpr6FXXRF5YNGxkPuzpbJKz3A4=
// -----END RSA PRIVATE KEY-----
// """
//
//         do {
//             try controller.importKey(privateKeyData: privkeyBase64)
//             print("key imported successfuly")
            print(controller.findKey())
//         } catch {
//             print(error.localizedDescription)
//         }
//
//         let payLoadData = "v=1;l=check24;t=j3pFa/Gm/ZTs+F85FO+Ncx0htI8sWuoS9P4CQ5RvSt7K0oR2869p7vzAuBfN+rauHuiNFRW4KubaBzlltGReXBGe6JpLmmV5BkQE17+JjpHuxXceNMBK8gBTowRxhSLZuebxwvDU9MFnd83J6uBgw5snYHbyWNdRNfqyS8eZkTw="

        if let code = controller.decryptPayLoad(data: "v=1;l=check24;t=I0SGE0raaGptUPdfmEuQNl9TpTKfPxPFYGuj4msA8Wa9v2FOHVf00CW6X2jhYS1JJ1mmELWMltujWZLVeeeJNekJ/oJarMNuRAD9x7vqQ8MbexgIiQkZseqkKDRQKbhg+I5YDFYYPHLbUl6EHSZt9OD9PoIxRGVtNxoqfYgzQKQ=") {
//         if let data = try? controller.decryptPayLoad(data: payLoadData, privkeyBase64: privkeyBase64),
//            let code = String(data: data, encoding: .utf8) {
            print("code is \(code)")
        } else {
            print("unable to find code")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
