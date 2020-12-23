# mt-plugin-DataAPIResponseOutput

DataAPIのレスポンスを静的なJSONで出力するプラグインになります。  
DataAPIのエンドポイントを指定することで、DataAPIのレスポンスを静的なファイルで書き出すことができます。

## Requirement

- Movable Type 7

## Installation

1. Unpack the mt-plugin-DataAPIResponseOutput archive.
2. Upload and copy the mt-plugin-DataAPIResponseOutput/plugins/mt-plugin-DataAPIResponseOutput folder to your MT's plugins folder. ( /path/to/mt/plugins )

## How to use

### Setting

出力先となるサイト・子サイトからインデックステンプレートを作成します。  
テンプレート編集画面に `<mt:DataAPIResponseOutput />` を定義して、出力先を `XXX.json` として設定します。

1. 設定したい先のサイト・子サイトのテンプレートを開く
1. インデックステンプレートを新規で作成
1. テンプレート編集画面で `<mt:DataAPIResponseOutput />` を入力
1. 出力先を入力 `XXX.json`
1. 再構築でDataAPIからのレスポンスを静的なJSONとして出力

### Set value

初期値のレスポンスは以下で出力を行います。
```
https://[mt_install_domain]/[mt_install_path]/mt-data-api.cgi/v4/sites
```

|モディファイア|初期値|説明|
|----|----|----|
|id|1|blog id（初期値はMTインストール時の初期サイトID）|
|url|[mt_install_domain]|MTをインストールしたドメイン|
|data_api|[mt_install_path]/mt-data-api.cgi/|MTを本体を格納したディレクトリパス + mt-data-api.cgi|
|endpoint|/sites|エンドポイント|
|version|4|Data API バージョン|
|param|なし|URI Parametersの設定|

```html
<mt:DataAPIResponseOutput
  id="1"
  url="https://example.com/"
  data_api="/cgi-bin/mt/"
  version="4"
  endpoint="/sites/{site_id}/entries"
  param="?limit=10"
/>
```

自身のMT環境へのDataAPIの取得・出力可能です。また違うMT先のData APIも取得し出力も可能になります。
