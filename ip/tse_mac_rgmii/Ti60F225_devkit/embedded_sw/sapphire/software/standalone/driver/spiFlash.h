///////////////////////////////////////////////////////////////////////////////////
//  MIT License
//  
//  Copyright (c) 2021 SaxonSoc contributors
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
///////////////////////////////////////////////////////////////////////////////////
#pragma once

#include "type.h"
#include "spi.h"
#include "gpio.h"
#include "io.h"


    static void spiFlash_select_withGpioCs(u32 gpio, u32 cs){
        gpio_setOutput(gpio, gpio_getOutput(gpio) & ~(1 << cs));
        bsp_uDelay(1);
    }
    
    static void spiFlash_diselect_withGpioCs(u32 gpio, u32 cs){
        gpio_setOutput(gpio, gpio_getOutput(gpio) | (1 << cs));
        bsp_uDelay(1);
    }
    
    static void spiFlash_select(u32 spi, u32 cs){
        spi_select(spi, cs);
    }
    
    static void spiFlash_diselect(u32 spi, u32 cs){
        spi_diselect(spi, cs);
    }
    
    static void spiFlash_init_(u32 spi){
        Spi_Config spiCfg;
        spiCfg.cpol = 0;
        spiCfg.cpha = 0;
        spiCfg.mode = 0;
        spiCfg.clkDivider = 2;
        spiCfg.ssSetup = 2;
        spiCfg.ssHold = 2;
        spiCfg.ssDisable = 2;
        spi_applyConfig(spi, &spiCfg);
    }
    
    static void spiFlash_init_withGpioCs(u32 spi, u32 gpio, u32 cs){
        spiFlash_init_(spi);
        gpio_setOutputEnable(gpio, gpio_getOutputEnable(gpio) | (1 << cs));
        spiFlash_diselect_withGpioCs(gpio,cs);
    }
    
    static void spiFlash_init(u32 spi, u32 cs){
        spiFlash_init_(spi);
        spiFlash_diselect(spi, cs);
    }
    
    static void spiFlash_wake_(u32 spi){
        spi_write(spi, 0xAB);
#ifdef DEFAULT_ADDRESS_BYTE
        //return to 3-byte addressing
        bsp_uDelay(300);
        spi_write(spi, 0xE9);
#endif
    }
    
    static void spiFlash_wake_withGpioCs(u32 spi, u32 gpio, u32 cs){
        spiFlash_select_withGpioCs(gpio,cs);
        spiFlash_wake_(spi);
        spiFlash_diselect_withGpioCs(gpio,cs);
        bsp_uDelay(200);
    }
    
    static void spiFlash_wake(u32 spi, u32 cs){
        spiFlash_select(spi,cs);
        spiFlash_wake_(spi);
        spiFlash_diselect(spi,cs);
        bsp_uDelay(200);
    }
    
    static void spiFlash_software_reset(u32 spi, u32 cs){
        spiFlash_select(spi,cs);
        spi_write(spi, 0x66);
        spiFlash_diselect(spi,cs);
        spiFlash_select(spi,cs);
        spi_write(spi, 0x99);
        spiFlash_diselect(spi,cs);
        bsp_uDelay(200);
    }
    
    static u8 spiFlash_read_id_(u32 spi){
        spi_write(spi, 0xAB);
        spi_write(spi, 0x00);
        spi_write(spi, 0x00);
        spi_write(spi, 0x00);
        return spi_read(spi);
    }
    
    static u8 spiFlash_read_id(u32 spi, u32 cs){
        u8 id;
        spiFlash_select(spi,cs);
        id = spiFlash_read_id_(spi);
        spiFlash_diselect(spi,cs);
        return id;
    }
    
    static void spiFlash_f2m_(u32 spi, u32 flashAddress, u32 memoryAddress, u32 size){
        spi_write(spi, 0x0B);
        spi_write(spi, flashAddress >> 16);
        spi_write(spi, flashAddress >>  8);
        spi_write(spi, flashAddress >>  0);
        spi_write(spi, 0);
        uint8_t *ram = (uint8_t *) memoryAddress;
        for(u32 idx = 0;idx < size;idx++){
            u8 value = spi_read(spi);
            *ram++ = value;
        }
    }
    
    static void spiFlash_f2m_withGpioCs(u32 spi,  u32 gpio, u32 cs, u32 flashAddress, u32 memoryAddress, u32 size){
        spiFlash_select_withGpioCs(gpio,cs);
        spiFlash_f2m_(spi, flashAddress, memoryAddress, size);
        spiFlash_diselect_withGpioCs(gpio,cs);
    }
    
    static void spiFlash_f2m(u32 spi, u32 cs, u32 flashAddress, u32 memoryAddress, u32 size){
        spiFlash_select(spi,cs);
        spiFlash_f2m_(spi, flashAddress, memoryAddress, size);
        spiFlash_diselect(spi,cs);
    }
