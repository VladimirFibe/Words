//
//  NetworkManagerModel.swift
//  Words
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation

protocol NetworkManagerDelegate {
    func getJoke(_ jokeManager: JokesManager, joke: JokesArr)
    func didFailWithError(error: Error)
}

class JokesManager {
    private let baseURL = "https://geek-jokes.sameerkumar.website/api?format=json"
    
    var delegate: NetworkManagerDelegate?
    
    func fetchJoke() {
        performRequest(with: baseURL)
    }
     
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let tasks = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let joke = self.parseJSON(safeData) {
                        self.delegate?.getJoke(self, joke: joke)
                    }
                }
            }
            tasks.resume()
        }
    }
    
    func parseJSON(_ jokeData: Data) -> JokesArr? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Joke.self, from: jokeData)
            let joke = decodedData.joke
            let showJoke = JokesArr(jokes: joke)
            return showJoke
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
