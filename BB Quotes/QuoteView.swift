//
//  QuoteView.swift
//  BB Quotes
//
//  Created by Daniel Ezekiel on 3/23/24.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            
            // BackgroundImage
            ZStack {
                Image(show.lowercased().filter { $0 != " " })
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    Spacer(minLength: 140)
                    
                    switch viewModel.status {
                    case .success(let data):
                        // Quote
                        Text("\"\(data.quote.quote)\"")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .cornerRadius(25)
                            .padding(.horizontal)
                        
                        // Character
                        ZStack(alignment: .bottom) {
//                            Image("jessepinkman")
//                                .resizable()
//                                .scaledToFill()
                            AsyncImage(url: data.character.images[0]) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)

                            
                            Text(data.quote.character)
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(.ultraThinMaterial)
                        }
                        .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                        .cornerRadius(80)
                        
                    case .fetching:
                        ProgressView()
                        
                    default:
                        EmptyView()
                    }
                    
                    Spacer()
                    
                    // Gen Random Quote
                    Button{
                        Task {
                            await viewModel.getData(for: show)
                        }
                    } label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("BreakingBadGreen"))
                            .cornerRadius(7)
                            .shadow(color: Color("BreakingBadYellow"), radius: 2)
                    }
                    
                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Better Call Saul")
        .preferredColorScheme(.dark)
}