//
//  ViewController.swift
//  ExChat
//
//  Created by 김종권 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {

    var messages: [(message: String, chatType: ChatMessageCell.ChatType)] = []

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16.0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ChatMessageCell.self, forCellWithReuseIdentifier: "cell")
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        messages = getMockMessages()
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        view.addSubview(collectionView)
    }

    private func makeConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChatMessageCell
        let message = messages[indexPath.row]
        cell.model = .init(message: message.message, chatType: message.chatType)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedFrame = messages[indexPath.row].message.getEstimatedFrame(with: .systemFont(ofSize: 18))
        return CGSize(width: view.bounds.width, height: estimatedFrame.height + 20)
    }
}
