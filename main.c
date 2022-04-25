//***********************************************************************
//******** CDA3331 Intro to Micro class, updated on April 3, 2018
//******** Dr. Bassem Alhalabi, FAU EE512, Boca Raton, Florida
//******** Contributors: Pablo Pastran 2015,
//******** Skeleton Program for Lab 4, in C
//******** This program is a transition form assembly to C, so you see in the comments the equivalent code in assembly
//******** Run this program as is to make sure you have correct hardware connections
//******** Explore the program and see the effect of Switches on pins P2.3-5
//******** Lab4 Grade --> Make the appropriate changes to the program per lab manual

#include <msp430.h>

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;    //Stop watch dog timer

    int R5_SW=0, R6_LED=0;

    P1OUT = 0b00000000;     //mov.b    #00000000b,&P1OUT
    P2OUT = 0xFF;           //make them all of them pull ups
    P1DIR = 0b11111111;     //mov.b    #11111111b,&P1DIR
    P2DIR = 0b00000000;     //mov.b    #00000000b,&P2DIR
    P2REN = 0xFF;           //enable all resistors on port 2

    while (1)
    {
        //read the states of the switches
        R5_SW = P2IN;       //mov.b    &P2IN, R5
        if (R5_SW & BIT0) //checking P2.0 for read mode
          {
            R6_LED = R5_SW & (BIT3 | BIT4 | BIT5);  // mask the pattern bits
            P1OUT = R6_LED;                         // display the pattern
          }

        else //read mode
        {
            if (R5_SW & BIT1) //rotation
                R6_LED = ((R6_LED>>1) | (R6_LED<<7)); //left to right
            else
                R6_LED = ((R6_LED<<1) | (R6_LED>>7)); //right to left
        }
                    R6_LED &= 0xFF;     //mask any excessive bits
                    P1OUT = R6_LED;     //pattern out - display it

                    if (R5_SW & BIT3) //rotation mode, my BIT2 (switch 3) was not working, BIT3 (switch 4) will work while not on read mode. I will use BIT3 for my demonstration but board should still work as intended
                                 __delay_cycles( 250000);  //fast
                            else
                                 __delay_cycles( 70000);  //slow
       } //end while
}// end main
