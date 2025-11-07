//
//  FilmListView.swift
//  GhibiSwiftUi
//
//  Created by Seneca on 7/11/2025.
//

import SwiftUI

struct FilmListView: View {
    
@State private var filmsViewModal = FilmsViewModel()
    
    var body: some View {
    
        NavigationStack{
        
            switch filmsViewModal.state {
                
            case .idle:
                
                Text("There is no Films")
                
            case .loading:
                
                ProgressView{
                    
                    Text("Loading...")
                    
                }
            case .loaded(let films):
                
                List(films) { film in
                    
                    Text(film.title)
                    
                }
            case .error(let error):
                
                Text(error).foregroundStyle(.red)
                
            }
            
        }.task {
            await filmsViewModal.fetch()
        }
    }
}

#Preview {
    FilmListView()
}
