//
//  ContentView.swift
//  HN
//
//  Created by Дмитрий Константинов on 18.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                Text(post.title)
            }
            .navigationBarTitle("HN")
        }
        .onAppear {
            networkManager.fetchValue()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
