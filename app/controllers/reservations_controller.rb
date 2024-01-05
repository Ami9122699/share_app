class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all
    end

    def confirm
        @reservation = Reservation.new(params.permit(:checkin, :checkout, :people))
        @room = Room.find(params[:room_id])
        @days = (@reservation.checkout - @reservation.checkin).to_i
        @price = @days*@room.price*@reservation.people
       
    end #confirmのend
    
    def create
      @reservation = Reservation.new(params.permit(:checkin, :checkout, :people))
        @room = Room.find(params[:reservation][:room_id])
        if  @reservation.save
       #binding.pry  
          flash[:notice] = "施設の予約が完了しました"
          redirect_to reservations_path
        else
       #binding.pry
          render "confirm"
        end
    end #createのend

    def show
      @reservation = Reservation.find(params[:id])
      @room = @reservation.room
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "予約を削除しました"
        redirect_to reservations_path
    end

    private
    def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :people)
    end


end
