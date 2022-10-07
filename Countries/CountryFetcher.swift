//
//  CountryFetcher.swift
//  Countries
//
//  Created by Nurzhan Ababakirov on 26/5/22.
//

import Foundation

@MainActor
class CountryFetcher: ObservableObject {
    
    let urlStr = "https://restcountries.com/v3.1/all?fields=name,flag"
    
    @Published var countries: [Country] = []
  
    enum FetchError: Error {
        case badRequest
    }
    
    func fetchData() async throws {
        guard let url = URL(string: urlStr) else { throw FetchError.badRequest; }
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        countries = try JSONDecoder().decode([Country].self, from: data)
    }
}
