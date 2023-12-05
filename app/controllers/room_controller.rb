class RoomController < ApplicationController

    def index
        @room = Room.all #allメソッドはテーブルのレコードを全て取得できるメソッド 
    end #indexのend

    def new
        @room = Room.new
    end #newのend
      
    def create
        @room = Room.new(room_params)
        if @room.save
          flash[:notice] = "新しい予定を登録しました"  
          redirect_to :room
        else
          flash[:notice] = "スケジュールの登録に失敗しました"
          render "new"
        end

    end #createのend
        
    def show
      @room = Room.find(params[:id])
    end #showのend

  

  private
  def room_params
  room.require(:room).permit(:name, :introduction, :price, :address)
  end

end
