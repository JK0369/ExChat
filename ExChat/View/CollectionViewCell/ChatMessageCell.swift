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
        view.layer.masksToBounds = false
        view.isEditable = false
        return view
    }()

    let profileImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "profile"))
        view.layer.cornerRadius = view.bounds.width / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        return view
    }()

    override func setupViews() {
        super.setupViews()

        contentView.addSubview(messaageTextView)
        messaageTextView.translatesAutoresizingMaskIntoConstraints = false
        messaageTextView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        messaageTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
    }

    private func bind() {
        guard let model = model, let font = messaageTextView.font else {
            return
        }
        messaageTextView.text = model.message
        let estimatedFrame = model.message.getEstimatedFrame(with: font)

        messaageTextView.widthAnchor.constraint(equalToConstant: estimatedFrame.width + 16).isActive = true

        if case .receive = model.chatType {
            messaageTextView.backgroundColor = .systemBlue
            profileImageView.isHidden = true
            messaageTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            messaageTextView.addTipViewToRightBottom(with: messaageTextView.backgroundColor)
        } else {
            messaageTextView.backgroundColor = .white
            profileImageView.isHidden = false
            messaageTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16 + profileImageView.bounds.width).isActive = true
            messaageTextView.addTipViewToLeftTop(with: messaageTextView.backgroundColor)
        }
    }
}
