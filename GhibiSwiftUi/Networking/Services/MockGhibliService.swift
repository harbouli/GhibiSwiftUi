//
//  MockGhibliService.swift
//  GhibiSwiftUi
//
//  Created by Seneca on 7/11/2025.
//

import Foundation


struct MockGhibliService: GhibliService {
    func fetchFilms() async throws  -> [Film] {
        return []
    }
}
