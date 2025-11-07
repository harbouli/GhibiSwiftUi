//
//  FilmsViewModel.swift
//  GhibiSwiftUi
//
//  Created by Seneca on 7/11/2025.
//

import Foundation
import Observation

enum ApiErrors:LocalizedError {
    case ivalidURL
    case unknown
    case ivalidRespond
    case decoding(Error)
    case networkingError(Error)
}


@Observable
class FilmsViewModel {
    enum State: Equatable {
    case idle
    case loading
    case loaded(films: [Film])
    case error(String)
    }
    var state :State = .idle
    var films: [Film] = []
    
    func fetch () async {
        guard state == .idle else { return}
        self.state = .loading
        do{
            let films = try await fetchFilms()
            self.state =  .loaded(films: films)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    private func fetchFilms() async throws ->[Film] {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            throw ApiErrors.ivalidURL}
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
             guard let httpRespond = response as? HTTPURLResponse,
                   (200...299).contains(httpRespond.statusCode) else {
                        throw ApiErrors.ivalidRespond
                      }
            return try JSONDecoder().decode([Film].self, from: data)

        } catch  let error as DecodingError{
            throw ApiErrors.decoding(error)
        } catch let error as URLError {
            throw ApiErrors.networkingError(error)
        }
    }
}
