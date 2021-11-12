## 作成されるリソース
- VPC *1
- パブリックサブネット *1
- インターネットゲートウェイ *1
- メインルートテーブル *1（VPC作成時に自動作成されるものです。今回使用しません）
- メインでないルートテーブル *1 （パブリックサブネットに紐づく）
- EC2のセキュリティグループ
  - `inbound` SSH 22
  - `outbound` 0.0.0.0/0 all
- EC2のキーペア
- EC2 インスタンスサイズはt3a.medium
- EBS 10Gi gp2

## 実行するために以下を行ってください
- ssh鍵作成

  ```bash
  $ mkdir sshkey
  $ ssh-keygen -t ed25519 -N "" -f <./sshkey/名前>
  ```

- terraform.tfvarsの下記を埋める

  - ssh_to_ec2

    SSHしたいクライアントマシンのIPアドレスレンジを記載

  - pubkey_path

    ssh公開鍵のパスを指定
