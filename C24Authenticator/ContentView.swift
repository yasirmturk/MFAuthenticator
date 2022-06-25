//
//  ContentView.swift
//  C24Authenticator
//
//  Created by Yasir Turk on 24.06.22.
//

import CodeScanner
import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    private let crypto: Crypto

    init() {
        crypto = Crypto()
    }

    @State private var showingAlert = false
    @State private var isPresentingScanner = false
    @State private var key: String = ""
    @State private var showingToken = false
    @State private var message: String = ""
    @State private var showingCode = false
    @State private var token: String = ""
    
    var body: some View {
        Text("Hello, C24 Authenticator!")
            .padding()

        Button("Generate Key") {
            print("Key generated")
            key = crypto.generateKey(label: "check24")
            showingAlert = true
        }
        .padding()
        .alert(key, isPresented: $showingAlert) {
            Button("Copy to Clipboard", role: .cancel) {
                UIPasteboard.general
                    .setValue(key, forPasteboardType: UTType.plainText.identifier)
            }
        }

        Button("Scan Code") {
            isPresentingScanner = true
        }
        .padding()
        .sheet(isPresented: $isPresentingScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "C24 Authenticator") { response in
                switch response {
                case .success(let result):
                    message = "Received token: \(result.string)"
                case .failure(let error):
                    message = error.localizedDescription
                }
                isPresentingScanner = false
                showingToken = true
            }
        }

        Text(message).padding()
        Button("Decrypt Token") {
            let payLoadData = "v=1;l=check24;t=I0SGE0raaGptUPdfmEuQNl9TpTKfPxPFYGuj4msA8Wa9v2FOHVf00CW6X2jhYS1JJ1mmELWMltujWZLVeeeJNekJ/oJarMNuRAD9x7vqQ8MbexgIiQkZseqkKDRQKbhg+I5YDFYYPHLbUl6EHSZt9OD9PoIxRGVtNxoqfYgzQKQ="
            if let payLoad = Payload(payLoadData), let code = crypto.decrypt(payLoad: payLoad) {
                token = "code is \(code)"
            } else {
                token = "unable to find code"
            }
            showingCode = true
        }
        .padding()
        .alert(token, isPresented: $showingCode) {
            Button("Ok", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
