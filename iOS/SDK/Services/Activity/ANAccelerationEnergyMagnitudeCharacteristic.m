/*
 * Copyright (c) 2016, Seraphim Sense Ltd.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions
 *    and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors may be used to
 *    endorse or promote products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 * CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#import "ANAccelerationEnergyMagnitudeCharacteristic.h"

@implementation ANAccelerationEnergyMagnitudeCharacteristic

+ (CBUUID *)UUID {
    return [CBUUID UUIDWithString:kAccelerationEnergyMagnitudeCharacteristicUUIDString];
}

- (void)processData {
    
    NSData *updatedValue = self.characteristic.value;
    if (updatedValue) {
        int value = 0;
        [updatedValue getBytes:&value length:3];
        _magnitude = value/100;
    }
//    uint8_t *dataPointer = (uint8_t *)[updatedValue bytes];
//    
//    uint8_t val0 = *(uint8_t *)dataPointer; dataPointer++;
//    uint8_t val1 = *(uint8_t *)dataPointer; dataPointer++;
//    uint8_t val2 = *(uint8_t *)dataPointer; dataPointer++;
    
//    _magnitude = (int)val0 | (int)val1 << 8 | (int)val2 << 16;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Acceleration Energy Magnitude Characteristic: %@", self.characteristic];
}
@end
