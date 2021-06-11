//
//  Service.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

class Service {
        
    func fetch(image imageUrl: String, completion: @escaping (Result<UIImage, Error>) -> ()) -> URLSessionDataTask? {

        guard let url = URL(string: imageUrl) else { return nil }

        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in

            if let err = err {
                completion(.failure(err))
                return
            }

            guard let data = data else {
                return
            }

            guard let img = UIImage(data: data) else {
                return
            }

            completion(.success(img))
        }
        task.resume()
        return task
    }
    
    
    func fetchData(success: ([Info]) -> Void) {
        let infoArray = Bundle.main.decode([Info].self, from: "testfile.json")
        success(infoArray)
    }
}
