//
//  DefaultGhibliService.swift
//  GhibiSwiftUi
//
//  Created by Seneca on 7/11/2025.
//

import Foundation


struct DefaultGhibliService:GhibliService {
     func fetchFilms() async throws ->[Film] {
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
