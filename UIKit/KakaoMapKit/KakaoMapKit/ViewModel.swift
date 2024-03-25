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
    private var busStopListRepository = BusStopListRepository()
    
    private let disposeBag = DisposeBag()
    
    private let mapName = "mapViewTest"
    
    deinit {
        mapController?.stopRendering()
        mapController?.stopEngine()
    }
    
    func transform(input: Input) -> Output {
        let output = Output(
            busStopInfoResponse: .init(value: [])
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
    
    func createPois() {
        let view = mapController?.getView(mapName) as! KakaoMap
        let manager = view.getLabelManager()
        manager.addLabelLayer(
            option: LabelLayerOptions(
                layerID: "PoiLayer",
                competitionType: .all,
                competitionUnit: .poi,
                orderType: .closerFromLeftBottom,
                zOrder: 1
            )
        )
        let layer = manager.getLabelLayer(layerID: "PoiLayer")
        let poiOption = PoiOptions(styleID: "PerLevelStyle")
        poiOption.rank = 0
        
        let poi1 = layer?.addPoi(
            option: poiOption,
            at: MapPoint(
                longitude: 127.108678,
                latitude: 37.402001
            )
        )
        // Poi 개별 Badge추가. 즉, 아래에서 생성된 Poi는 Style에 빌트인되어있는 badge와, Poi가 개별적으로 가지고 있는 Badge를 갖게 된다.
        let badge = PoiBadge(
            badgeID: "noti",
            image: UIImage(systemName: "bus.fill"),
            offset: .init(x: 0.5, y: 0.5),
            zOrder: 1
        )
        poi1?.addBadge(badge)
        poi1?.show()
        poi1?.showBadge(badgeID: "noti")
    }
}

extension ViewModel: MapControllerDelegate {
    func addViews() {
        let defaultPosition = MapPoint(
            longitude: 127.108678,
            latitude: 37.402001
        )
        let mapviewInfo = MapviewInfo(
            viewName: mapName,
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
        createPois()
    }
    
    func authenticationSucceeded() {
        mapController?.startRendering()
    }
    
    func authenticationFailed(_ errorCode: Int, desc: String) {
        print(errorCode, desc)
    }
    
    func containerDidResized(_ size: CGSize) {
        let mapView = mapController?.getView(mapName) as? KakaoMap
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
        let busStopInfoResponse: BehaviorSubject<[BusStopInfoResponse]>
    }
}
