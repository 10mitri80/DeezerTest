//
//  PostListProtocols.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit

protocol ArtistListViewProtocol: class {
    var presenter: ArtistListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showArtists(with artists: [ArtistModel])
    
    func showError()
}

protocol ArtistListWireFrameProtocol: class {
    static func createArtistListModule() -> UIViewController
    
    // PRESENTER -> WIREFRAME
    func presentAlbumDetailScreen(from view: ArtistListViewProtocol, forArtistId artistId: Int)
}

protocol ArtistListPresenterProtocol: class {
    var view: ArtistListViewProtocol? { get set }
    var interactor: ArtistListInteractorInputProtocol? { get set }
    var wireFrame: ArtistListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func searchArtistsByName(name: String)
    func showAlbumDetail(forArtistId artistId: Int)
}

protocol ArtistListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveArtists(_ artists: [ArtistModel])
    func onError()
}

protocol ArtistListInteractorInputProtocol: class {
    var presenter: ArtistListInteractorOutputProtocol? { get set }
    var remoteDatamanager: ArtistListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func searchArtistsByName(name: String)
}

protocol ArtistListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: ArtistListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func searchArtistsByName(name: String)
}

protocol ArtistListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onArtistsRetrieved(_ artists: [ArtistModel])
    func onError()
}
