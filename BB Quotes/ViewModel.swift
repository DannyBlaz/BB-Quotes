//
//  ViewModel.swift
//  BB Quotes
//
//  Created by Daniel Ezekiel on 3/23/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject{
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: Quote, character: Character))
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    
    private let controller: FetchController
    
    init(controller: FetchController){
        self.controller = controller
    }
    
    func getData(for show:String) async {
        status = .fetching
        
        do {
            let quote = try await controller.fetchQuote(from: show)
            
            let character = try await controller.fetchCharacter(quote.character)
            
            status = .success(data: (quote, character))
        } catch {
            status = .failed(error: error)
        }
    }
}
