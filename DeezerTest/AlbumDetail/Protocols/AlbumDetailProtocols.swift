//
//  AlbumDetailProtocols.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit

protocol AlbumDetailViewProtocol: class {
    var presenter: AlbumDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showAlbumDetail(with: AlbumModel, tracks: [TrackModel])
}

protocol AlbumDetailWireFrameProtocol: class {
    static func createAlbumDetailModule(forArtistId artistId: Int) -> UIViewController
}

protocol AlbumDetailPresenterProtocol: class {
    var view: AlbumDetailViewProtocol? { get set }
    var interactor: AlbumDetailInteractorInputProtocol? { get set }
    var wireFrame: AlbumDetailWireFrameProtocol? { get set }
    var artistId: Int? { get set }
    
    // VIEW -> PRESENTER
    func showAlbumDetail()
}

protocol AlbumDetailRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: AlbumDetailRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func getAlbumWithArtistId(artistId: Int)
}

protocol AlbumDetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onAlbumsRetrieved(_ album: AlbumModel, tracks: [TrackModel])
    func onError()
}

protocol AlbumDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveAlbums(_ album: AlbumModel, tracks: [TrackModel])
    func onError()
}

protocol AlbumDetailInteractorInputProtocol: class {
    var presenter: AlbumDetailInteractorOutputProtocol? { get set }
    var remoteDatamanager: AlbumDetailRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getAlbumWithArtistId(artistId: Int)
}
