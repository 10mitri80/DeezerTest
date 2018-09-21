//
//  ArtistListRemoteDataManager.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ArtistListRemoteDataManager:ArtistListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ArtistListRemoteDataManagerOutputProtocol?
    
    func searchArtistsByName(name: String){
        Alamofire
            .request(Endpoints.Artists.fetch.url+name, method: .get)
            .validate()
            .responseArray(keyPath: "data", completionHandler: { (response: DataResponse<[ArtistModel]>) in
                switch response.result {
                case .success(let artists):
                    self.remoteRequestHandler?.onArtistsRetrieved(artists)

                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
}
