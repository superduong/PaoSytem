//
//  PaoCollectionViewController.swift
//  PAOV2
//
//  Created by Duong Do Van on 4/11/19.
//  Copyright © 2019 Duong Do Van. All rights reserved.
//

import UIKit

struct Pao {
    let imgName: String
    let numberText: String
    let personText: String
    let actionText: String
    let objectText: String
}

class PaoViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    var questionsArray = [Pao]()
    var score: Int = 0
    var currentQuestionNumber = 1
    
    var window: UIWindow?
    
    var arrPersons = Array(arrayLiteral: "NGƯỜI TUYẾT","NICVJIC","CÁI NÓN","CÁI MÔI ĐỎ","CÁI RỔ XANH","CÁI LÒ","CÁI GỐI MỀM","RONADOL","CON VỊT","SUARES","MESSI","NEYMAR","BILL GATES","ĐẶNG VĂN LÂM","CHƯ BẮT GIỚI","PÊ LÊ","PÁC MAN","OBAMA","TIVI","BUFFET","GIÁO HOÀNG ĐANG","NAI TƠ","COCACOLA","NƯỚC MẮM","NOEL","BUZAN","MAN ĐÊ NAL","MẮC KEN","QUANG HUY","THẦY PHONG","JIM ROHN","WẮC ZA","COVEY","CẬU CHIÊU","MIỆNG RỘNG","DIANA","HỒ NGỌC HÀ","MẮT KÍNH","MUỖI VẰN","MÁY BAY","BÉT BA TỐP","FU CÔN SƠN","RẮN NƯỚC","RAU MUỐNG","ỔNG HẢI","RAU L","ỔNG HIỆP","HILARY","LÊ LỢI","BÁC HỒ","CÔNG","LỤT TOẸT","PUTIN","LÍNH MỸ","LÒI RON","DALE CA NE GIƠ","STEVN JOB","LƯỚI KÉO","BOLT","CÁC LÔ LÚT TI","TONY ROBBIN","PANDA","GÀ NÓI","MOU NI NHÔ","AMAZON","ELON MUSK","KING KÔNG","KLOP","GIÁO VIÊN","HOÀI LINH","CON SÓC","GUỐC ĐI AN NA","CÁI NÔI","CÁ MẬP","ADAM KHOO","TIẾN MINH","XUÂN BẮC","CHIM CU","KIẾN VÀNG","CON BƯỚM","BAMBO","MR BEAN","H XUÂN VINH","MS THẢO","FACEBOOK","CÔNG VINH","VIÊN GẠCH","VŨ CÔNG","KAKA","BALE","BÁC SỸ","QUANG LIÊM","BẮP NƯỚNG","BÁNH MỲ","BÚN RIÊU","CÔNG PHƯỢNG","ÁNH VIÊN","LÝ HOÀNG NAM","ZIN ĐAN","LÝ TIỂU LONG")
    
    
    var dicNumberAction: Dictionary<String, String> = ["00":"LUỘC","01":"BƠI","02":"ĐỘI","03":"HÔN","04":"ÚP","05":"NƯỚNG","06":"RƠI","07":"CỞI TRẦN","08":"XOẠC","09":"CẮN","10":"VUNG",
                                                       "11":"ĂN VẠ","12":"THẢ","13":"CẦU NGUYỆN","14":"HIẾP","15":"HÚT","16":"NOCK OUT","17":"RẶN","18":"18","19":"TRADE","20":"KHÁM","21":"GẶM","22":"ƯỚP","23":"CHƯNG","24":"PHÁT","25":"VẼ","26":"ÔM","27":"CHỬI","28":"BÌNH","29":"ĐEO","30":"CHÙI","31":"CODE","32":"ĐẠP","33":"MAY","34":"HÁ","35":"35","36":"UỐN","37":"RƠI","38":"HÚT","39":"BAY","40":"VẢY","41":"SẤY","42":"VỒ","43":"MỌC","44":"ĐỔ","45":"NỔ","46":"KHOE","47":"GHEN","48":"TRẢ","49":"CƯA","50":"NÂNG","51":"HIẾP","52":"SĂN","53":"GIẾT","54":"CHỌC","55":"55","56":"BÓP","57":"VỚT","58":"XĂM",
                                                       "59":"NGẬM","60":"ĐẨY","61":"LUYỆN","62":"THIẾN","63":"CÒNG","64":"CHỊCH","65":"ĐUA","66":"BÊ","67":"HÉT","68":"TÁT","69":"HỈ","70":"NUỐT","71":"CÀO","72":"LƯỚT","73":"NGẬM","74":"MÚT","75":"MÚA","76":"TÁT","77":"HÓT","78":"XÂY","79":"HÍT","80":"CẠO","81":"LÉM","82":"CƯỚP","83":"ẤP","84":"HẤP","85":"VẪY","86":"NÉM",
                                                       "87":"VẠCH","88":"TẠ ƠN","89":"BÒ",
                                                       "90":"SỐC","91":"CƯỚI","92":"NƯỚNG","93":"NỔI","94":"94","95":"CHÉM",
                                                       "96":"TRÚT BỎ","97":"QUẦN","98":"CHỤP","99":"THỔI"]
    
    var arrActions = Array(arrayLiteral: "LUỘC","BƠI","ĐỘI","HÔN","ÚP","NƯỚNG","RƠI","CỞI TRẦN","XOẠC","CẮN","VUNG","ĂN VẠ","THẢ","CẦU NGUYỆN","HIẾP","HÚT","NOCK OUT","RẶN","18","TRADE","KHÁM","GẶM","ƯỚP","CHƯNG","PHÁT","VẼ","ÔM","CHỬI","BÌNH","ĐEO","CHÙI","CODE","ĐẠP","MAY","HÁ","35","UỐN","RƠI","HÚT","BAY","VẢY","SẤY","VỒ","MỌC","ĐỔ","NỔ","KHOE","GHEN","TRẢ","CƯA","NÂNG","HIẾP","SĂN","GIẾT","CHỌC","55","BÓP","VỚT","XĂM","NGẬM","ĐẨY","LUYỆN","THIẾN","CÒNG","CHỊCH","ĐUA","BÊ","HÉT","TÁT","HỈ","NUỐT","CÀO","LƯỚT","NGẬM","MÚT","MÚA","TÁT","HÓT","XÂY","HÍT","CẠO","LÉM","CƯỚP","ẤP","HẤP","VẪY","NÉM","VẠCH","TẠ ƠN","BÒ","SỐC","CƯỚI","NƯỚNG","NỔI","94","CHÉM","TRÚT BỎ","QUẦN","CHỤP","THỔI")
    
    var arrNumbers = Array(arrayLiteral: "00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99")
    
    var arrObjects = Array(arrayLiteral: "ẤM ĐUN NƯỚC","TẬP ĐOÀN HOA SEN","QUẢ DƯA HẤU","CON KHỈ","CÁ SẤU","CÁ CHUỐI","XUỐNG GIƯỜNG","KHOE 6 MÚI","BÈO BỒNG","CŨI SẮT","HAI TAY","SÂN CỎ","MUỖI","Ở KHUNG THÀNH","YÊU QUÁI","MA TUÝ","BOXING","TRƯỚC ĐÁM ĐÔNG","ĐI ỐT","CHỨNG KHOÁN","QUẢNG TRƯỜNG THÁNH PHÊ RÔ","CỎ XANH","ĐÁ LẠNH","Ở PHÚ QUỐC","NGƯỜI TÂM THẦN","SƠ ĐỒ TƯ DUY","NAM PHI","NƯỚC ĐỨC","VTC","HUY CHƯƠNG KỶ LỤC","7 THỊNH VƯỢNG","C++","XE ĐẠP","BAO LÔ","MIỆNG","AIDS","YOGA","ĐƯỜNG","MÁU","BAMBO AIRWAY","HOA HỒNG","TÓC","MA LÀNG","Ở AO LÀNG","RÁC HSBC","RAU LANG","RĂNG GIẢ","BILL CLINTON","KIẾM","BÔM","TẠ","LỌ LEM","NƯỚC NGA","FOREST GUMP","BỤNG","ĐẮC NHÂN TÂM","TÁO CHIM","THÁNH PHÊ RÔ","ĐIỀN KINH","AC MILLAN","ĐẢO FIJI","KUNGFU","HÒN","NGƯỜI ĐẶC BIỆT","CLOUD","XE TELSA","NINH BÌNH","LIVERPOOL","MẪU GIÁO","DÉP LÀO","CÁI ĐUÔI","TÓC MANCHESTER CITY","SÓNG","RĂNG NHỌN","TAY","CỘT CẦU LÔNG","SE ĐOOC","QUẦN ĐÙI","TỔ ẤM","PHẤN NỤ","ROCKY","MẮT","SÚNG","TRUNG THU","WHATAPSS","SUZUKI CUP","TƯỜNG","Ở VŨ TRƯỜNG","CHÚA","REAL MADRID","THUỐC","ĐẠI KIỆN TƯỚNG","THAN HỒNG","TRONG LÒ","BÚN RIÊU","NGHỆ AN","ÁO BƠI","VỚI VỢT","CÚP C1 VÀO ĐẦU","THANH GỖ")
    
    var dict:[String:[String]] = [:]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        //        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let nextIndex = min(pageControl.currentPage + 1, questionsArray.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        //        collectionView?.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    func startTimer() {
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PaoViewController.handleNext), userInfo: nil, repeats: true);
        
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = questionsArray.count
        pc.currentPageIndicatorTintColor = .mainPink
        //            pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "DƯƠNG VÔ ĐỊCH SIÊU TRÍ NHỚ 2019"
        
        questionsArray = reloadData()
        
//        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView.register(PaoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
        startTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PaoCell
        cell.pao = questionsArray[indexPath.row]
        //        cell.question=questionsArray[indexPath.row]
        //        cell.delegate = self as! QuizCVCellDelegate
        //        let page = pages[indexPath.item]
        //        cell.page = page
        
        
        //        cell.bearImageView.image = UIImage(named: page.imageName)
        //        cell.descriptionTextView.text = page.headerText
        
        //        let imageName = imageNames[indexPath.item]
        //        cell.bearImageView.image = UIImage(named: imageName)
        //        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        // definitely don't try this, it is a very bad idea
        //        let imageView = UIImageView()
        //        cell.addSubview(imageView)
        
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func reloadData() -> [Pao]{
        var paos: [Pao] = []
        
        while arrNumbers.count > 0 {
            
            // random key from array
            let index = Int(arc4random_uniform(UInt32(arrNumbers.count)))
            
            let valueNumber: String = arrNumbers[index]
            let valuePerson: String = arrPersons[index]
            let valueAction: String = arrActions[index]
            let valueObject: String = arrObjects[index]
            
            // make sure the number isnt repeated
            arrNumbers.remove(at: index)
            arrPersons.remove(at: index)
            arrActions.remove(at: index)
            arrObjects.remove(at: index)
            let pao = Pao(imgName: valueNumber, numberText: valueNumber, personText: valuePerson, actionText: valueAction, objectText: valueObject)
            paos.append(pao)
        }
        return paos
    }
}
