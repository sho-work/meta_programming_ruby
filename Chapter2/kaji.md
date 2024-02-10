## オープンクラス
> classの主な仕事はあなたをクラスのコンテキストに連れて行くことだ
- 納得。。。

## オブジェクトモデル
- クラスは誰かのインスタンスであることは知らなかった
- クラスメソッドは実質、インスタンスのクラスのインスタンスメソッドというのは納得
```ruby
class MyClass; end
MyClass.class
Module.class
Class.class
#=> 全てClassクラスのインスタンス

MyClass.superclass
#=> Object
Class.superclass
#=> Module
Module.superclass
#=> Object
#=> 全てObjectのサブクラス
```
- ややこしいけど何となくは理解した
- ClassのsuperclassがModuleなのは意外だった
- Rubyは全てがオブジェクトってそういう意味ねとよくわかった

## includeとprepend
includeはincluderの継承チェーンの上に置かれる
prependはincluderの継承チェーンの下に置かれる

## クラス名は定数
普段使っているクラス名は、Classクラスのインスタンスを指す定数だった

## Kernel
Objectクラスにインクルードされているため、全てのオブジェクトから呼び出し可能

## privateメソッド
説明しろって言われたらふわっとしかできなかったけど、レシーバを指定できないってのはわかりやすかった
```ruby
module MyModule
  def public_method
    puts "This is a public method"
    private_method
  end

  private

  def private_method
    puts "This is a private method"
  end
end

class MyClass
  include MyModule

  # 呼べる
  def hoge
    public_method
  end

  # 呼べる
  def fuga
    private_method
  end
end

instance = MyClass.new
instance.public_method
#=> "This is a public method"
instance.private_method
#=> Error
```

## refineとusing
- ここまでのスコープ管理が入ってくると、ちょっとメンテナンス性がガクッと落ちる気がする
- 個人開発でどうしてもって時か、俺はRubyistだぜって見せつけたいときにしか使わないだろう

## 意見交換したいこと
- オープンクラス、モンキーパッチ使ってますか？
  オープンクラスは、String, TimeZoneあたりに独自メソッドをはやしてる
モンキーパッチは、そんなにやっていない気がする...
- オープンクラス用のファイルはどこに置くのが正解なのか
  railsだとinitializerに置いてます
- レシーバが誰なのか確認するのはいつもどうやっているか
  bindingでselfをとってます
- selfを明示するかどうか
  普段開発しているプロダクトにはRubocopがいるので、省略できるselfは書いてない

