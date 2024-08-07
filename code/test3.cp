#line 1 "C:/Users/Administrator/Desktop/embeded project/test3.c"
#line 12 "C:/Users/Administrator/Desktop/embeded project/test3.c"
int counter=0;

void automatic_traffic() {

 while( portA.b1  == 1) {
 for(counter = 15; counter > 0; counter--) {

 portb.b1 =1 ;
 portb.b2=1;
 portb.b3=1;
 portb.b4=1;
 portc = (counter % 10) + (counter / 10) * 16;



 if(counter > 3) {
  portD.b0  = 1;  portD.b3  = 1;
  portD.b5  = 0;  portD.b4  = 0;  portD.b2  = 0;  portD.b1  = 0;
 } else {
  portD.b4  = 1;  portD.b0  = 1;
  portD.b2  = 0;  portD.b1  = 0;  portD.b3  = 0;  portD.b5  = 0;
 }

 if( portA.b0  == 0) {
 portc = 0;
 break;
 }

 delay_ms(1000);
 }

 for(counter = 23; counter > 0; counter--) {
 if( portA.b0  == 0) {
 portc = 0;
 break;
 }

 portC = (counter % 10) + (counter / 10) * 16;
 portb.b1 =1 ;
 portb.b2=1;
 portb.b3=1;
 portb.b4=1;

 if(counter > 3) {
  portD.b2  = 1;  portD.b5  = 1;
  portD.b4  = 0;  portD.b3  = 0;  portD.b1  = 0;  portD.b0  = 0;
 } else {
  portD.b1  = 1;  portD.b5  = 1;
  portD.b2  = 0;  portD.b0  = 0;  portD.b4  = 0;  portD.b3  = 0;
 }

 delay_ms(1000);
 }
 }
}

 void manual_traffic(){
 if( portb.B0 ==1){

  portD.b1 =1;  portD.b0 =0;  portD.b2 =0;
  portD.b4 =0;  portD.b3 =1;  portD.b5 =0;
 portb.b1 =1 ;
 portb.b2=1;
 portb.b3=1;
 portb.b4=1;
 portC=0;

 } else {

  portD.b1 =0;  portD.b0 =0;  portD.b2 =1;
  portD.b4 =1;  portD.b3 =0;  portD.b5 =0;
 portb.b1 =1 ;
 portb.b2=1;
 portb.b3=1;
 portb.b4=1;
 portc=0;
 }
 }
#line 103 "C:/Users/Administrator/Desktop/embeded project/test3.c"
 void interrupt (){
 if( portb.B0 ==1){
 if(intf_bit==1){
 intf_bit=0;
 if( portD.b2 ==1){
  portD.b2 =0;  portD.b0 =1;  portD.b1 =0;
  portD.b4 =1;  portD.b5 =0;  portD.b3 =0;
 delay_ms(3000);
 }
 else if( portD.b3 ==1){
  portD.b3 =0;  portD.b5 =1;  portD.b4 =0;
  portD.b1 =1;  portD.b2 =0;  portD.b0 =0;
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


 while( portA.b0 ==1);
 while(1){
 if( portA.b1 ==1){

 automatic_traffic();

 }
 else if( portb.B0 ==1){

 manual_traffic();
 }



 }
}
