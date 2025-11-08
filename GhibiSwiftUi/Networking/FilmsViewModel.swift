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
    
    private let service: GhibliService
    
    init( service: GhibliService = DefaultGhibliService()) {
     
        self.service = service
    }
    
    func fetch () async {
        guard state == .idle else { return}
        self.state = .loading
        do{
            let films = try await service.fetchFilms()
            self.state =  .loaded(films: films)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    }
