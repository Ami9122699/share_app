class Room < ApplicationRecord
    has_many :reservations  # 子の方のモデル名の複数形 を書きます。has_manyの方が複数形なことは Railsの命名規則でマスト ですのでお気をつけください。(英文と同じですね！) 
    

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: true
    validates :address, presence: true

end
