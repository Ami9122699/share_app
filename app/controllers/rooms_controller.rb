class RoomsController < ApplicationController

    def index
        @rooms = Room.all #allメソッドはテーブルのレコードを全て取得できるメソッド 
    end #indexのend

    def new
        @room = Room.new
    end #newのend
      
    def create
        @room = Room.new(room_params)
        if @room.save
          flash[:notice] = "新しい施設を登録しました"  
          redirect_to rooms_path
        else
          flash[:notice] = "施設の登録に失敗しました"
          render "new"
        end
        
    end #createのend

    def show
      @room = Room.find(params[:id])
      @reservations = Reservation.all
    end
   
    def edit
    end
   
    def update
    end
   
    def destroy
      @room = Room.find(params[:id])
      @room.destroy
      flash[:notice] = "施設を削除しました"
      redirect_to rooms_path
    end
        
  private
  def room_params
    params.require(:room) .permit(:name, :introduction, :price, :address)
  end

end

