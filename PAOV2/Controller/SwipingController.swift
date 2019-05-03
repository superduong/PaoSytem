//
//  SwipingController.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/12/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit
/*
extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

struct Question {
    let imgName: String
    let questionText: String
    let paoText: String
    let correctAns: Int
    var wrongAns: Int
    var isAnswered: Bool
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: ""),
        Page(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "")
    ]
    
    var questionsArray = [Question]()
    var score: Int = 0
    var currentQuestionNumber = 1
    
    var window: UIWindow?
    
    var arr1 = Array(arrayLiteral: "SÔI","NICK","NÓN","MÔI","RỔ","LÒ","GỐI")
    
    var dicNumberAction: Dictionary<String, String> = ["00":"LUỘC","01":"BƠI","02":"ĐỘI","03":"HÔN","04":"ÚP","05":"NƯỚNG","06":"RƠI","07":"CỞI TRẦN","08":"XOẠC","09":"CẮN","10":"VUNG",
                                                       "11":"ĂN VẠ","12":"THẢ","13":"CẦU NGUYỆN","14":"HIẾP","15":"HÚT","16":"NOCK OUT","17":"RẶN","18":"18","19":"TRADE","20":"KHÁM","21":"GẶM","22":"ƯỚP","23":"CHƯNG","24":"PHÁT","25":"VẼ","26":"ÔM","27":"CHỬI","28":"BÌNH","29":"ĐEO","30":"CHÙI","31":"CODE","32":"ĐẠP","33":"MAY","34":"HÁ","35":"35","36":"UỐN","37":"RƠI","38":"HÚT","39":"BAY","40":"VẢY","41":"SẤY","42":"VỒ","43":"MỌC","44":"ĐỔ","45":"NỔ","46":"KHOE","47":"GHEN","48":"TRẢ","49":"CƯA","50":"NÂNG","51":"HIẾP","52":"SĂN","53":"GIẾT","54":"CHỌC","55":"55","56":"BÓP","57":"VỚT","58":"XĂM",
                                                       "59":"NGẬM","60":"ĐẨY","61":"LUYỆN","62":"THIẾN","63":"CÒNG","64":"CHỊCH","65":"ĐUA","66":"BÊ","67":"HÉT","68":"TÁT","69":"HỈ","70":"NUỐT","71":"CÀO","72":"LƯỚT","73":"NGẬM","74":"MÚT","75":"MÚA","76":"TÁT","77":"HÓT","78":"XÂY","79":"HÍT","80":"CẠO","81":"LÉM","82":"CƯỚP","83":"ẤP","84":"HẤP","85":"VẪY","86":"NÉM",
                                                       "87":"VẠCH","88":"TẠ ƠN","89":"BÒ",
                                                       "90":"SỐC","91":"CƯỚI","92":"NƯỚNG","93":"NỔI","94":"94","95":"CHÉM",
                                                       "96":"TRÚT BỎ","97":"QUẦN","98":"CHỤP","99":"THỔI"]
    
    let arrAction = Array(arrayLiteral: "LUỘC","BƠI","ĐỘI","HÔN","ÚP","NƯỚNG","RƠI","CỞI TRẦN","XOẠC","CẮN","VUNG","ĂN VẠ","THẢ","CẦU NGUYỆN","HIẾP","HÚT","NOCK OUT","RẶN","18","TRADE","KHÁM","GẶM","ƯỚP","CHƯNG","PHÁT","VẼ","ÔM","CHỬI","BÌNH","ĐEO","CHÙI","CODE","ĐẠP","MAY","HÁ","35","UỐN","RƠI","HÚT","BAY","VẢY","SẤY","VỒ","MỌC","ĐỔ","NỔ","KHOE","GHEN","TRẢ","CƯA","NÂNG","HIẾP","SĂN","GIẾT","CHỌC","55","BÓP","VỚT","XĂM","NGẬM","ĐẨY","LUYỆN","THIẾN","CÒNG","CHỊCH","ĐUA","BÊ","HÉT","TÁT","HỈ","NUỐT","CÀO","LƯỚT","NGẬM","MÚT","MÚA","TÁT","HÓT","XÂY","HÍT","CẠO","LÉM","CƯỚP","ẤP","HẤP","VẪY","NÉM","VẠCH","TẠ ƠN","BÒ","SỐC","CƯỚI","NƯỚNG","NỔI","94","CHÉM","TRÚT BỎ","QUẦN","CHỤP","THỔI")
    
    var arrNumbers = Array(arrayLiteral: "00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99")
    
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
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SwipingController.handleNext), userInfo: nil, repeats: true);
        
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = questionsArray.count
        pc.currentPageIndicatorTintColor = .mainPink
//       	 pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
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
        
        questionsArray = reloadData()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .white
//        collectionView?.register(.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(QuizCVCell.self, forCellWithReuseIdentifier: "cellId")
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! QuizCVCell
        cell.question=questionsArray[indexPath.row]
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
    
    func reloadData() -> [Question]{
        var questions: [Question] = []
        
        for _ in 0 ..< arrNumbers.count{
            // get random index
            let index: Int = Int(arc4random_uniform(UInt32(dicNumberAction.count)))
            // get key & value
            var randomKey: String = Array(dicNumberAction.keys)[index]
            let randomValue: String = Array(dicNumberAction.values)[index]
            // remove key & value above from dic
            dicNumberAction.removeValue(forKey: randomValue)
            //         arr1.shuffle()
            // declare a array incluce 3 random element
            var elementAdd: [String] = arr1.randomElements(number: 3)
            
            // check random value from dic is unavailable in elementAdd
            // condition that random value available in elementAdd array
            while elementAdd.contains(randomValue) {
                let indexs = Int(arc4random_uniform(UInt32(dict.count)))
                randomKey = Array(dicNumberAction.keys)[indexs]
                let randomVal = Array(dicNumberAction.values)[indexs]
                dicNumberAction.removeValue(forKey: randomVal)
                elementAdd = arr1.randomElements(number: 3)
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
                print(strings[j])
                if strings[j] == randomValue {
                    correctIndex = j
                }
            }
            let question = Question( imgName: dict.keys.first as! String, questionText: dict.keys.first as! String, paoText: randomValue, correctAns: correctIndex, wrongAns: -1, isAnswered: false)
            questions.append(question)
            dict.removeAll()
        }
        return questions
    }
    
}
 */
