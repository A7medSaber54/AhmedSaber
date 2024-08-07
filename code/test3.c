#define start portA.b0
#define automatic portA.b1
#define manual  portb.B0
#define rw portD.b0
#define yw portD.b1
#define gw portD.b2
#define rs portD.b5
#define ys portD.b4
#define gs portD.b3


int counter=0;

  void automatic_traffic() {

    while(automatic == 1) {
        for(counter = 15; counter > 0; counter--) {
             portb.b1 =1 ;
             portb.b2=1;
             portb.b3=1;
             portb.b4=1;
           portc = (counter % 10) + (counter / 10) * 16;
            if(counter > 3) {
                rw = 1; gs = 1;
                rs = 0; ys = 0; gw = 0; yw = 0;
            } else {
                ys = 1; rw = 1;
                gw = 0; yw = 0; gs = 0; rs = 0;
            }
            if(start == 0) {
                portc = 0;
                break;
            }
            delay_ms(1000);
        }
        for(counter = 23; counter > 0; counter--) {
            if(start == 0) {
                portc = 0;
                break; }
            portC = (counter % 10) + (counter / 10) * 16;
            portb.b1 =1 ;
             portb.b2=1;
             portb.b3=1;
             portb.b4=1;
            if(counter > 3) {
                gw = 1; rs = 1;
                ys = 0; gs = 0; yw = 0; rw = 0;
            } else {
                yw = 1; rs = 1;
                gw = 0; rw = 0; ys = 0; gs = 0;
            }
            delay_ms(1000);
        }
  }
}
 void manual_traffic(){
  if(manual==1){
//    west stop south go
    yw=1; rw=0; gw=0;
    ys=0; gs=1; rs=0;
    portb.b1 =1 ;
             portb.b2=1;
             portb.b3=1;
             portb.b4=1;
    portC=0;
    
  } else {
   //south stop west go
     yw=0; rw=0; gw=1;
    ys=1; gs=0; rs=0;
   portb.b1 =1 ;
             portb.b2=1;
             portb.b3=1;
             portb.b4=1;
    portc=0;
  }
 }


 void interrupt (){
 if(manual==1){
  if(intf_bit==1){
       intf_bit=0;
      if(gw==1){
       gw=0; rw=1; yw=0;
       ys=1; rs=0; gs=0;
       delay_ms(3000);
      }
      else if(gs==1){
       gs=0; rs=1; ys=0;
       yw=1; gw=0; rw=0;
       delay_ms(3000);
      }

       
   }

 }

 }
void main() {
       adcon1=7;
       trisa=0b111111;
       trisb=0b00000001;
       
       trisc=0;
       trisd=0;
       portd=0;
       porta=0b111011;
       portc=0;
       portb=0b00000001;
       gie_bit=1;
       inte_bit=1;
       intedg_bit=0;


       while(start==1);
       while(1){
           if(automatic==1){

            automatic_traffic();

           }
           else if(manual==1){

            manual_traffic();
           }



       }
}