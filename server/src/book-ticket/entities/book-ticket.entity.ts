export class Seat {
  seat_id: string;
  ticket_price: string;
};

export class BookTicket {
  showtimes_id: string;
  list_seat: Seat[];
}

export class CreateShowtimes{
    film_id:string;
    showing_times:string;
    cinema_id:string;
    ticket_price:string;
}