class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all.includes(:room)
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
          flash[:notice] = "新しい予約を登録しました"  
          redirect_to reservation_path
        else
        @room = Room.find_by(params[:reservation][:room_id])
          flash[:notice] = "予約の登録に失敗しました"
          render "new"
        end
        
    end #createのend

    def show
        @reservation = Reservation.find(params[:id])
        @room = Room.new
        @checkout = @reservation["checkout"] 
        @checkin = @reservation["checkin"] 
        @totalday = @checkout - @checkin
        @totalprice = @totalday * @room.price
    end #showのend

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "予約を削除しました"
        redirect_to reservations_path
    end

    private
    def reservation_params
    params.require(:reservation) .permit(:checkin, :checkout, :people)
    end

end
