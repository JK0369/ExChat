//
//  ChatMessageCell.swift
//  ExChat
//
//  Created by 김종권 on 2021/10/31.
//

import UIKit

class ChatMessageCell: BaseCollectionViewCell {

    enum ChatType: CaseIterable {
        case receive
        case send
    }

    struct Model {
        let message: String
        let chatType: ChatType
    }

    var model: Model? {
        didSet { bind() }
    }

    let messaageTextView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 18.0)
        view.text = "Sample message"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 15.0
        view.layer.masksToBounds = true
        view.isEditable = false
        return view
    }()

    override func setupViews() {
        super.setupViews()

        contentView.addSubview(messaageTextView)
        messaageTextView.translatesAutoresizingMaskIntoConstraints = false
        messaageTextView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        messaageTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func bind() {
        guard let model = model, let font = messaageTextView.font else {
            return
        }
        messaageTextView.text = model.message
        let estimatedFrame = model.message.getEstimatedFrame(with: font)

        messaageTextView.widthAnchor.constraint(equalToConstant: estimatedFrame.width + 16).isActive = true

        if case .receive = model.chatType {
            messaageTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        } else {
            messaageTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        }
    }
}
