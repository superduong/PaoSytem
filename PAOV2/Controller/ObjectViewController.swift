//
//  ObjectViewController.swift
//  PAOV2
//
//  Created by Duong Do Van on 4/10/19.
//  Copyright © 2019 Duong Do Van. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "cellId"

struct Object {
    let imgName: String
    let numText: String
    let objectText: String
//    let correctAns: Int
//    var wrongAns: Int
//    var isAnswered: Bool
}

class ObjectViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var questionsArray = [Object]()
    var score: Int = 0
    var currentQuestionNumber = 1
    
    var window: UIWindow?
    
    var arr1 = Array(arrayLiteral: "SÔI","NICK","NÓN","MÔI","RỔ","LÒ","GỐI")
    
    var personPAO = Array(arrayLiteral: "NGƯỜI TUYẾT","NICVJIC","CÁI NÓN","CÁI MÔI ĐỎ","CÁI RỔ XANH","CÁI LÒ","CÁI GỐI MỀM","RONADOL","CON VỊT","SUARES","MESSI","NEYMAR","BILL GATES","ĐẶNG VĂN LÂM","CHƯ BẮT GIỚI","PÊ LÊ","PÁC MAN","OBAMA","TIVI","BUFFET","GIÁO HOÀNG ĐANG","NAI TƠ","COCACOLA","NƯỚC MẮM","NOEL","BUZAN","MAN ĐÊ NAL","MẮC KEN","QUANG HUY","THẦY PHONG","JIM ROHN","WẮC ZA","COVEY","CẬU CHIÊU","MIỆNG RỘNG","DIANA","HỒ NGỌC HÀ","MẮT KÍNH","MUỖI VẰN","MÁY BAY","BÉT BA TỐP","FU CÔN SƠN","RẮN NƯỚC","RAU MUỐNG","ỔNG HẢI","RAU L","ỔNG HIỆP","HILARY","LÊ LỢI","BÁC HỒ","CÔNG","LỤT TOẸT","PUTIN","LÍNH MỸ","LÒI RON","DALE CA NE GIƠ","STEVN JOB","LƯỚI KÉO","BOLT","CÁC LÔ LÚT TI","TONY ROBBIN","PANDA","GÀ NÓI","MOU NI NHÔ","AMAZON","ELON MUSK","KING KÔNG","KLOP","GIÁO VIÊN","HOÀI LINH","CON SÓC","GUỐC ĐI AN NA","CÁI NÔI","CÁ MẬP","ADAM KHOO","TIẾN MINH","XUÂN BẮC","CHIM CU","KIẾN VÀNG","CON BƯỚM","BAMBO","MR BEAN","H XUÂN VINH","MS THẢO","FACEBOOK","CÔNG VINH","VIÊN GẠCH","VŨ CÔNG","KAKA","BALE","BÁC SỸ","QUANG LIÊM","BẮP NƯỚNG","BÁNH MỲ","BÚN RIÊU","CÔNG PHƯỢNG","ÁNH VIÊN","LÝ HOÀNG NAM","ZIN ĐAN","LÝ TIỂU LONG")
    
    var dicNumberPerson: Dictionary<String, String> = ["00":"NGƯỜI TUYẾT","01":"NICVJIC","02":"CÁI NÓN","03":"CÁI MÔI ĐỎ","04":"CÁI RỔ XANH","05":"CÁI LÒ","06":"CÁI GỐI MỀM","07":"RONADOL","08":"CON VỊT","09":"SUARES","10":"MESSI","11":"NEYMAR","12":"BILL GATES","13":"ĐẶNG VĂN LÂM","14":"CHƯ BẮT GIỚI","15":
        "PÊ LÊ","16":"PÁC MAN","17":"OBAMA","18":"TIVI","19":"BUFFET","20":"GIÁO HOÀNG ĐANG","21":"NAI TƠ","22":
        "COCACOLA","23":"NƯỚC MẮM","24":"NOEL","25":"BUZAN","26":"MAN ĐÊ NAL","27":"MẮC KEN","28":"QUANG HUY","29":"THẦY PHONG","30":"JIM ROHN","31":"WẮC ZA","32":"COVEY","33":"CẬU CHIÊU","34":"MIỆNG RỘNG","35":"DIANA","36":"HỒ NGỌC HÀ","37":"MẮT KÍNH","38":"MUỖI VẰN","39":"MÁY BAY","40":"BÉT BA TỐP","41":"FU CÔN SƠN","42":"RẮN NƯỚC","43":"RAU MUỐNG","44":"ỔNG HẢI","45":"RAU L","46":"ỔNG HIỆP","47":"HILARY","48":"LÊ LỢI","49":"BÁC HỒ","50":"CÔNG","51":"LỤT TOẸT","52":"PUTIN","53":"LÍNH MỸ","54":"LÒI RON","55":"DALE CA NE GIƠ","56":"STEVN JOB","57":"LƯỚI KÉO","58":"BOLT","59":"CÁC LÔ LÚT TI","60":"TONY ROBBIN","61":"PANDA","62":"GÀ NÓI","63":"MOU NI NHÔ","64":"AMAZON","65":"ELON MUSK","66":"KING KÔNG","67":"KLOP","68":"GIÁO VIÊN","69":"HOÀI LINH","70":"CON SÓC","71":"GUỐC ĐI AN NA","72":"CÁI NÔI","73":"CÁ MẬP","74":"ADAM KHOO","75":"TIẾN MINH","76":"XUÂN BẮC","77":"CHIM CU","78":"KIẾN VÀNG","79":"CON BƯỚM","80":"BAMBO","81":"MR BEAN","82":"H XUÂN VINH","83":"MS THẢO","84":"FACEBOOK","85":"CÔNG VINH","86":"VIÊN GẠCH","87":"VŨ CÔNG","88":"KAKA","89":"BALE","90":"BÁC SỸ","91":"QUANG LIÊM","92":"BẮP NƯỚNG","93":"BÁNH MỲ","94":"BÚN RIÊU","95":"CÔNG PHƯỢNG","96":"ÁNH VIÊN","97":"LÝ HOÀNG NAM","98":"ZIN ĐAN","99":"LÝ TIỂU LONG"]
    
    let arrAction = Array(arrayLiteral: "LUỘC","BƠI","ĐỘI","HÔN","ÚP","NƯỚNG","RƠI","CỞI TRẦN","XOẠC","CẮN","VUNG","ĂN VẠ","THẢ","CẦU NGUYỆN","HIẾP","HÚT","NOCK OUT","RẶN","18","TRADE","KHÁM","GẶM","ƯỚP","CHƯNG","PHÁT","VẼ","ÔM","CHỬI","BÌNH","ĐEO","CHÙI","CODE","ĐẠP","MAY","HÁ","35","UỐN","RƠI","HÚT","BAY","VẢY","SẤY","VỒ","MỌC","ĐỔ","NỔ","KHOE","GHEN","TRẢ","CƯA","NÂNG","HIẾP","SĂN","GIẾT","CHỌC","55","BÓP","VỚT","XĂM","NGẬM","ĐẨY","LUYỆN","THIẾN","CÒNG","CHỊCH","ĐUA","BÊ","HÉT","TÁT","HỈ","NUỐT","CÀO","LƯỚT","NGẬM","MÚT","MÚA","TÁT","HÓT","XÂY","HÍT","CẠO","LÉM","CƯỚP","ẤP","HẤP","VẪY","NÉM","VẠCH","TẠ ƠN","BÒ","SỐC","CƯỚI","NƯỚNG","NỔI","94","CHÉM","TRÚT BỎ","QUẦN","CHỤP","THỔI")
    
    var arrNumbers = Array(arrayLiteral: "00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99")
    
    var arrObjects = Array(arrayLiteral: "ẤM ĐUN NƯỚC","TẬP ĐOÀN HOA SEN","QUẢ DƯA HẤU","CON KHỈ","CÁ SẤU","CÁ CHUỐI","XUỐNG GIƯỜNG","KHOE 6 MÚI","BÈO BỒNG","CŨI SẮT","HAI TAY","SÂN CỎ","MUỖI","Ở KHUNG THÀNH","YÊU QUÁI","MA TUÝ","BOXING","TRƯỚC ĐÁM ĐÔNG","ĐI ỐT","CHỨNG KHOÁN","QUẢNG TRƯỜNG THÁNH PHÊ RÔ","CỎ XANH","ĐÁ LẠNH","Ở PHÚ QUỐC","NGƯỜI TÂM THẦN","SƠ ĐỒ TƯ DUY","NAM PHI","NƯỚC ĐỨC","VTC","HUY CHƯƠNG KỶ LỤC","7 THỊNH VƯỢNG","C++","XE ĐẠP","BAO LÔ","MIỆNG","AIDS","YOGA","ĐƯỜNG","MÁU","BAMBO AIRWAY","HOA HỒNG","TÓC","MA LÀNG","Ở AO LÀNG","RÁC HSBC","RAU LANG","RĂNG GIẢ","BILL CLINTON","KIẾM","BÔM","TẠ","LỌ LEM","NƯỚC NGA","FOREST GUMP","BỤNG","ĐẮC NHÂN TÂM","TÁO CHIM","THÁNH PHÊ RÔ","ĐIỀN KINH","AC MILLAN","ĐẢO FIJI","KUNGFU","HÒN","NGƯỜI ĐẶC BIỆT","CLOUD","XE TELSA","NINH BÌNH","LIVERPOOL","MẪU GIÁO","DÉP LÀO","CÁI ĐUÔI","TÓC MANCHESTER CITY","SÓNG","RĂNG NHỌN","TAY","CỘT CẦU LÔNG","SE ĐOOC","QUẦN ĐÙI","TỔ ẤM","PHẤN NỤ","ROCKY","MẮT","SÚNG","TRUNG THU","WHATAPSS","SUZUKI CUP","TƯỜNG","Ở VŨ TRƯỜNG","CHÚA","REAL MADRID","THUỐC","ĐẠI KIỆN TƯỚNG","THAN HỒNG","TRONG LÒ","BÚN RIÊU","NGHỆ AN","ÁO BƠI","VỚI VỢT","CÚP C1 VÀO ĐẦU","THANH GỖ")
    
    var dicNumberObject: Dictionary<String, String> = ["00":
        "ẤM ĐUN NƯỚC",
                                                       "01":
        "TẬP ĐOÀN HOA SEN",
                                                       "02":
        "QUẢ DƯA HẤU",
                                                       "03":
        "CON KHỈ",
                                                       "04":
        "CÁ SẤU",
                                                       "05":
        "CÁ CHUỐI",
                                                       "06":
        "XUỐNG GIƯỜNG",
                                                       "07":
        "KHOE 6 MÚI",
                                                       "08":
        "BÈO BỒNG",
                                                       "09":"CŨI SẮT",
                                                       "10":
        "HAI TAY",
                                                       "11":
        "SÂN CỎ",
                                                       "12":
        "MUỖI",
                                                       "13":
        "Ở KHUNG THÀNH",
                                                       "14":
        "YÊU QUÁI",
                                                       "15":
        "MA TUÝ",
                                                       "16":
        "BOXING",
                                                       "17":
        "TRƯỚC ĐÁM ĐÔNG",
                                                       "18":
        "ĐI ỐT",
                                                       "19":
        "CHỨNG KHOÁN",
                                                       "20":
        "QUẢNG TRƯỜNG THÁNH PHÊ RÔ",
                                                       "21":
        "CỎ XANH",
                                                       "22":
        "ĐÁ LẠNH",
                                                       "23":
        "Ở PHÚ QUỐC",
                                                       "24":
        "NGƯỜI TÂM THẦN",
                                                       "25":
        "SƠ ĐỒ TƯ DUY",
                                                       "26":
        "NAM PHI",
                                                       "27":
        "NƯỚC ĐỨC",
                                                       "28":
        "VTC",
                                                       "29":
        "HUY CHƯƠNG KỶ LỤC",
                                                       "30":
        "7 THỊNH VƯỢNG",
                                                       "31":
        "C++",
                                                       "32":
        "XE ĐẠP",
                                                       "33":
        "BAO LÔ",
                                                       "34":
        "MIỆNG",
                                                       "35":
        "AIDS",
                                                       "36":
        "YOGA",
                                                       "37":
        "ĐƯỜNG",
                                                       "38":
        "MÁU",
                                                       "39":
        "BAMBO AIRWAY",
                                                       "40":
        "HOA HỒNG",
                                                       "41":
        "TÓC",
                                                       "42":
        "MA LÀNG",
                                                       "43":
        "Ở AO LÀNG",
                                                       "44":
        "RÁC HSBC",
                                                       "45":
        "RAU LANG",
                                                       "46":
        "RĂNG GIẢ",
                                                       "47":
        "BILL CLINTON",
                                                       "48":
        "KIẾM",
                                                       "49":
        "BÔM",
                                                       "50":
        "TẠ","51":
        "LỌ LEM",
                                                       "52":
        "NƯỚC NGA",
                                                       "53":
        "FOREST GUMP",
                                                       "54":
        "BỤNG",
                                                       "55":
        "ĐẮC NHÂN TÂM",
                                                       "56":
        "TÁO CHIM",
                                                       "57":
        "THÁNH PHÊ RÔ",
                                                       "58":
        "ĐIỀN KINH",
                                                       "59":
        "AC MILLAN",
                                                       "60":
        "ĐẢO FIJI",
                                                       "61":
        "KUNGFU","62":"HÒN",
                                                       "63":"NGƯỜI ĐẶC BIỆT",
                                                       "64":"CLOUD",
                                                       "65":"XE TELSA",
                                                       "66":"NINH BÌNH",
                                                       "67":"LIVERPOOL",
                                                       "68":"MẪU GIÁO",
                                                       "69":"DÉP LÀO",
                                                       "70":"CÁI ĐUÔI",
                                                       "71":"TÓC MANCHESTER CITY",
                                                       "72":"SÓNG",
                                                       "73":"RĂNG NHỌN",
                                                       "74":"TAY",
                                                       "75":"CỘT CẦU LÔNG",
                                                       "76":"SE ĐOOC",
                                                       "77":"QUẦN ĐÙI",
                                                       "78":"TỔ ẤM",
                                                       "79":"PHẤN NỤ",
                                                       "80":"ROCKY",
                                                       "81":"MẮT",
                                                       "82":"SÚNG",
                                                       "83":"TRUNG THU",
                                                       "84":"WHATAPSS",
                                                       "85":"SUZUKI CUP",
                                                       "86":"TƯỜNG",
                                                       "87":"Ở VŨ TRƯỜNG",
                                                       "88":"CHÚA",
                                                       "89":"REAL MADRID",
                                                       "90":"THUỐC",
                                                       "91":"ĐẠI KIỆN TƯỚNG",
                                                       "92":"THAN HỒNG",
                                                       "93":"TRONG LÒ",
                                                       "94":"BÚN RIÊU",
                                                       "95":"NGHỆ AN",
                                                       "96":"ÁO BƠI",
                                                       "97":"VỚI VỢT",
                                                       "98":"CÚP C1 VÀO ĐẦU",
                                                       "99":"THANH GỖ"]
    
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
    /*
     func scrollToNextCell(){
     
     //get Collection View Instance
     let collectionView:UICollectionView;
     
     //get cell size
     let cellSize = CGSize(self.view.frame.width, self.view.frame.height);
     
     //get current content Offset of the Collection view
     let contentOffset = collectionView.contentOffset;
     
     //scroll to next cell
     collectionView.scrollRectToVisible(CGRectMake(contentOffset.x + cellSize.width, contentOffset.y, cellSize.width, cellSize.height), animated: true);
     
     
     }*/
    
    
    func startTimer() {
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.handleNext), userInfo: nil, repeats: true);
        
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
        collectionView?.register(ObjectCell.self, forCellWithReuseIdentifier: "cellId")
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ObjectCell
        cell.object = questionsArray[indexPath.row]
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
    
    func reloadData() -> [Object]{
        var objects: [Object] = []
        
        /*
        for _ in 0 ..< arrNumbers.count{
            // get random index
            let index: Int = Int(arc4random_uniform(UInt32(dicNumberObject.count)))
            // get key & value
            var randomKey: String = Array(dicNumberObject.keys)[index]
            let randomValue: String = Array(dicNumberObject.values)[index]
            // remove key & value above from dic
            dicNumberObject.removeValue(forKey: randomValue)
            //         arr1.shuffle()
            // declare a array incluce 3 random element
            var elementAdd: [String] = arrObjects.randomElements(number: 3)
            
            // check random value from dic is unavailable in elementAdd
            // condition that random value available in elementAdd array
            while elementAdd.contains(randomValue) {
                let indexs = Int(arc4random_uniform(UInt32(dict.count)))
                randomKey = Array(dicNumberObject.keys)[indexs]
                let randomVal = Array(dicNumberObject.values)[indexs]
                dicNumberObject.removeValue(forKey: randomVal)
                elementAdd = arrObjects.randomElements(number: 3)
            }
            // Add random value in elementAdd array, now it includes 4 elements
            elementAdd.append(randomValue)
            // Change position elements in array
            elementAdd = elementAdd.shuffled()
            // update in dict:[String:[String]] dictionary
            dict.updateValue(elementAdd, forKey: randomKey)
            
            var correctIndex: Int = 0
            var strings = Array(dict.values)[0]
            for j in 0..<strings.count{
                if strings[j] == randomValue {
                    correctIndex = j
                }
            }
            let object = Object(imgName: dict.keys.first as! String, numText: dict.keys.first as! String, objectText: randomValue, correctAns: correctIndex, wrongAns: -1, isAnswered: false)
            objects.append(object)
            dict.removeAll()
        }*/
        
        while arrNumbers.count > 0 {
            
            // random key from array
            let index = Int(arc4random_uniform(UInt32(arrNumbers.count)))
            
            let valueNumber: String = arrNumbers[index]
            let valueObject: String = arrObjects[index]
            
            // make sure the number isnt repeated
            arrNumbers.remove(at: index)
            arrObjects.remove(at: index)
            
            let object = Object(imgName: valueNumber, numText: valueNumber, objectText: valueObject)
            objects.append(object)
        }
        
        return objects
    }
}
