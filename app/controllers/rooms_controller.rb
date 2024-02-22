class RoomsController < ApplicationController

    def index
        #@rooms = Room.all #allメソッドはテーブルのレコードを全て取得できるメソッド
        @users = current_user
        @rooms = @users.rooms.all 
    end #indexのend

    def new
        @room = Room.new
        @user = current_user
        #@room = @user.rooms.new
    end #newのend
      
    def create
        @user = current_user
        #@room = @user.rooms.new(room_params)
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
      @reservation = Reservation.new
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

