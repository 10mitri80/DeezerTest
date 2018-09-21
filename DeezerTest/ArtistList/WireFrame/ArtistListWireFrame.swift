//
//  ArtistListWireFrame.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit

class ArtistListWireFrame: ArtistListWireFrameProtocol {
    
    class func createArtistListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ArtistsNavigationController")
        if let view = navController.childViewControllers.first as? ArtistListView {
            let presenter: ArtistListPresenterProtocol & ArtistListInteractorOutputProtocol = ArtistListPresenter()
            let interactor: ArtistListInteractorInputProtocol & ArtistListRemoteDataManagerOutputProtocol = ArtistListInteractor()
            let remoteDataManager: ArtistListRemoteDataManagerInputProtocol = ArtistListRemoteDataManager()
            let wireFrame: ArtistListWireFrameProtocol = ArtistListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentAlbumDetailScreen(from view: ArtistListViewProtocol, forArtistId artistId: Int) {
        let artistDetailViewController = AlbumDetailWireFrame.createAlbumDetailModule(forArtistId: artistId)

        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(artistDetailViewController, animated: true)
        }
    }
}
