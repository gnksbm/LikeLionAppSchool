//
//  ViewModel.swift
//  KakaoMapKit
//
//  Created by gnksmb on 2/3/24.
//

import Foundation

import RxSwift
import KakaoMapsSDK

final class ViewModel: NSObject {
    private var mapController: KMController?
    
    private let disposeBag = DisposeBag()
    
    deinit {
        mapController?.stopRendering()
        mapController?.stopEngine()
    }
    
    func transform(input: Input) -> Output {
        let output = Output(
        )
        
        input.viewWillAppearEvent
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.startMapController()
                }
            )
            .disposed(by: disposeBag)
        
        input.viewWillDisappearEvent
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.mapController?.stopRendering()
                }
            )
            .disposed(by: disposeBag)
        
        input.viewDidDisappearEvent
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.mapController?.stopEngine()
                }
            )
            .disposed(by: disposeBag)
        
        setupMapController(mapContainer: input.mapContainer)
        
        UIApplication.rx.willResignActive
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.mapController?.stopRendering()
                }
            )
            .disposed(by: disposeBag)
        
        UIApplication.rx.didBecomeActive
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.mapController?.startRendering()
                }
            )
            .disposed(by: disposeBag)
        
        return output
    }
    
    private func setupMapController(mapContainer: KMViewContainer) {
        mapController = .init(viewContainer: mapContainer)
        mapController?.delegate = self
        mapController?.initEngine()
    }
    
    private func startMapController() {
        mapController?.startEngine()
        mapController?.authenticate()
    }
}

extension ViewModel: MapControllerDelegate {
    func addViews() {
        let defaultPosition = MapPoint(
            longitude: 127.108678,
            latitude: 37.402001
        )
        let mapviewInfo = MapviewInfo(
            viewName: "mapViewTest",
            appName: "openmap",
            viewInfoName: "map",
            defaultPosition: defaultPosition,
            defaultLevel: 7
        )
        switch mapController?.addView(mapviewInfo) {
        case .OK:
            break
        case .alreadyExist:
            break
        case .failed:
            break
        case .none:
            break
        @unknown default:
            break
        }
    }
    
    func authenticationSucceeded() {
        mapController?.startRendering()
    }
    
    func authenticationFailed(_ errorCode: Int, desc: String) {
        print(errorCode, desc)
    }
    
    func containerDidResized(_ size: CGSize) {
        let mapView = mapController?.getView("mapViewTest") as? KakaoMap
        mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
    }
}

extension ViewModel {
    struct Input { 
        let mapContainer: KMViewContainer
        let viewWillAppearEvent: Observable<Void>
        let viewWillDisappearEvent: Observable<Void>
        let viewDidDisappearEvent: Observable<Void>
    }
    
    struct Output {
        
    }
}
