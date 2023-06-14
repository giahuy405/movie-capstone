import { ApiProperty } from "@nestjs/swagger";

export class Seat {
  seat_id: string;
  ticket_price: string;
};

export class BookTicket {
  @ApiProperty()
  showtimes_id: string;
  @ApiProperty()
  list_ticket: [
    {
      seat_id: string;
      ticket_price: string;
    }
  ];
}

export class CreateShowtimes{
    film_id:string;
    showing_times:string;
    cinema_id:string;
    ticket_price:string;
}