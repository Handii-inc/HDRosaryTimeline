import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK:- Sub components
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIndentifier)
        return view
    }()
    
    //MARK:- Fields
    private let reuseIndentifier: String = "Nanoha"
    private lazy var sampleControllers: [UIViewController] = [
        CardTypeTimelineViewController(),
        ColoredTimelineViewController(),
        LoadingTimelineViewController()
    ]

    //MARK:- Life cycle events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }

    override func viewWillLayoutSubviews() {
        self.view.frame = UIScreen.main.bounds
        
        let sharedHeight: CGFloat
            = UIApplication.shared.statusBarFrame.height
            + (self.navigationController?.navigationBar.frame.height ?? 0)
        self.tableView.frame = CGRect(x: 0,
                                      y: sharedHeight,
                                      width: self.view.frame.width,
                                      height: self.view.frame.height - sharedHeight)
        
        return
    }

    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.sampleControllers[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
        return
    }
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sampleControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: self.reuseIndentifier) else {
            return UITableViewCell(style: .default, reuseIdentifier: self.reuseIndentifier)
        }
        cell.textLabel?.text = self.sampleControllers[indexPath.row].title
        return cell
    }
}

