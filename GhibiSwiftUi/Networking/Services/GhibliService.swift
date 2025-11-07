//
//  ApiService.swift
//  GhibiSwiftUi
//
//  Created by Seneca on 7/11/2025.
//

import Foundation


protocol GhibliService {
    func fetchFilms(completion: @escaping (Result<[Film], Error>) -> ())
}
