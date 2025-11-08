//
//  FilmListView.swift
//  GhibiSwiftUi
//
//  Created by Seneca on 7/11/2025.
//

import SwiftUI

struct FilmListView: View {
    
@State private var filmsViewModal = FilmsViewModel()
    let columns:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
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
                NavigationStack{
                    LazyVGrid(columns: columns) { ForEach(films) { film in
                        VStack( )
                        {  Text(film.producer).multilineTextAlignment(.center)
                        }.padding()
                    }
                    }
                    
                    
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
