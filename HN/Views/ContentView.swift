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
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle(String(getCurrentDate()))
        }
        .onAppear {
            networkManager.fetchValue()
            
        }
    }
    
    func getCurrentDate() -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        return df.string(from: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
