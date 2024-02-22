class ReservationsController < ApplicationController
    #before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド 
    
    def new
        @reservation = Reservation.new
    end #newのend

    def index
        @reservations = Reservation.all
        @rooms = Room.all
    end

    def confirm
        # binding.pry
        #@room = Room.find(params[:reservation][:room_id])
        #@reservation = Reservation.new(reservation_params)
        @reservation = Reservation.new(params.permit(:checkin, :checkout, :people))
        @room = Room.find(params[:room_id]) 
        @days = (@reservation.checkout - @reservation.checkin).to_i
        @price = @days*@room.price*@reservation.people
        if @reservation.invalid?
          render 'confirm'
        end    
    end #confirmのend

    def create
        # ここでreservation_paramsを使用する
        @reservation = Reservation.new(reservation_params)
        # room_idをparamsから取得し、@reservationに追加する
        @reservation.room_id = params[:reservation][:room_id]
        #@reservation.room_id = current_room.id 
        #@reservation = Reservation.new(params.require(:reservation).permit(:content, :room_id))
        #@reservation = Reservation.new(params.permit(:checkin, :checkout, :people))
        #@room = Room.find(params[:id])
        if  @reservation.save
        #binding.pry  
          flash[:notice] = "施設の予約が完了しました"
          redirect_to reservations_path
        else
          
       #binding.pry
          flash.now[:alert] = "予約の保存に失敗しました"
          render "confirm"
        end
    end #createのend

    def show
      
      @room = Room.new
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "予約を削除しました"
        redirect_to reservations_path
    end

    private
    def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :people, :room_id, :user_id) 
    end
    #room_idをストロングパラメーターに含める

end
