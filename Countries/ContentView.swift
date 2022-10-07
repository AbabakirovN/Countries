//
//  ContentView.swift
//  Countries
//
//  Created by Nurzhan Ababakirov on 26/5/22.
//

import SwiftUI

struct CountryView: View{
    var flag: String
    
    var body: some View {
        Text(flag)
    }
}
struct ContentView: View {
    @StateObject var fetcher = CountryFetcher();
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    if (fetcher.countries.count > 0) {
                    ForEach(fetcher.countries, id: \.self.name.common) { country in
                        NavigationLink(destination: CountryView(flag: country.flag)) {
                            Text(country.name.common)
                        }
                    }
                } else {
                    Text("Loading..")
                }
                }.task {
                    try? await fetcher.fetchData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
