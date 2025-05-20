#include <stdint.h>

#include "bsp.h"
#include "io.h"

void print_hex(uint32_t val, uint32_t digits)
{
    for (int i = (4*digits)-4; i >= 0; i -= 4)
        uart_write(BSP_UART_TERMINAL, "0123456789ABCDEF"[(val >> i) % 16]);
}


void print(uint8_t * data) {
  uart_writeStr(BSP_UART_TERMINAL, data);
}

#define mem ((volatile uint32_t*)0x00020000) // DDR Start Address fo SOC
#define MAX_WORDS (8 * 1024 * 1024)

void main() {

    print("Memory test\n\r");

    for(int i=0;i<MAX_WORDS;i++) mem[i] = i;

    for(int i=0;i<MAX_WORDS;i++) {
      if (mem[i] != i) {

    print("Failed at address 0x");
    print_hex(i, 8);
    print(" with value 0x");
    print_hex(mem[i], 8);
    print("\n\r");

        while(1){}
      }
    }

    print("Success\n\r");

    while(1){}
}

