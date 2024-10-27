//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Joyanta Mondal on 26/10/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(users) { user in
                        Text(user.firstName)
                    }
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
