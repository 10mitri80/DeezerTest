//
//  AlbumDetailWireFrame.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit

class AlbumDetailWireFrame: AlbumDetailWireFrameProtocol {

    class func createAlbumDetailModule(forArtistId artistId: Int) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "AlbumDetailController")
        if let view = viewController as? AlbumDetailView {
            let presenter: AlbumDetailPresenterProtocol & AlbumDetailInteractorOutputProtocol = AlbumDetailPresenter()
            let interactor: AlbumDetailInteractorInputProtocol & AlbumDetailRemoteDataManagerOutputProtocol = AlbumDetailInteractor()
            let remoteDataManager: AlbumDetailRemoteDataManagerInputProtocol = AlbumDetailRemoteDataManager()
            let wireFrame: AlbumDetailWireFrameProtocol = AlbumDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.artistId = artistId
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
